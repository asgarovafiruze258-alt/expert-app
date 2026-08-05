import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../chat/presentation/providers/chat_providers.dart';
import '../../../favorite/domain/entities/favorite_entity.dart';
import '../../../favorite/presentation/widgets/favorite_button.dart';
import '../../../order/domain/entities/order_entity.dart';
import '../../../order/presentation/widgets/create_order_sheet.dart';
import '../../../review/presentation/providers/review_providers.dart';
import '../../../review/presentation/widgets/review_tile.dart';
import '../../domain/entities/worker_entity.dart';
import '../providers/worker_providers.dart';

class WorkerDetailScreen extends ConsumerWidget {
  final String workerId;

  const WorkerDetailScreen({super.key, required this.workerId});

  Future<void> _callWorker(BuildContext context, String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    await launchUrl(uri);
  }

  void _openOrderSheet(BuildContext context, WorkerEntity worker) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => CreateOrderSheet(targetType: OrderTargetType.worker, targetId: worker.id),
    );
  }

  Future<void> _openChat(BuildContext context, WidgetRef ref, WorkerEntity worker) async {
    final chat = await ref
        .read(openChatControllerProvider.notifier)
        .open(otherUserId: worker.id);
    if (chat == null || !context.mounted) return;
    context.push('/chats/${chat.id}', extra: worker.fullName);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final workerAsync = ref.watch(workerDetailProvider(workerId));

    return Scaffold(
      body: workerAsync.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (worker) {
          final theme = Theme.of(context);
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: Text(worker.fullName),
                actions: [
                  FavoriteButton(targetType: FavoriteTargetType.worker, targetId: worker.id),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: worker.avatarUrl != null
                                    ? CachedNetworkImageProvider(worker.avatarUrl!)
                                    : null,
                                child: worker.avatarUrl == null
                                    ? Text(
                                        worker.fullName.isNotEmpty
                                            ? worker.fullName[0].toUpperCase()
                                            : '?',
                                        style: const TextStyle(fontSize: 28),
                                      )
                                    : null,
                              ),
                              if (worker.isOnline)
                                Positioned(
                                  right: 2,
                                  bottom: 2,
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: theme.colorScheme.surface, width: 2),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(worker.fullName, style: theme.textTheme.titleLarge),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.star, size: 16, color: Colors.amber),
                                    const SizedBox(width: 4),
                                    Text('${worker.rating.toStringAsFixed(1)} (${worker.reviewCount})'),
                                    const SizedBox(width: 12),
                                    Icon(
                                      worker.isAvailable ? Icons.check_circle_outline : Icons.cancel_outlined,
                                      size: 16,
                                      color: worker.isAvailable ? Colors.green : theme.colorScheme.error,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      worker.isAvailable ? l10n.workerAvailable : l10n.workerUnavailable,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                if (worker.priceFrom != null) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    worker.priceTo != null
                                        ? '${worker.priceFrom!.toStringAsFixed(0)}-${worker.priceTo!.toStringAsFixed(0)}₼'
                                        : '${worker.priceFrom!.toStringAsFixed(0)}₼-dən',
                                    style: theme.textTheme.titleSmall
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (worker.categoryNames.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: worker.categoryNames.map((c) => Chip(label: Text(c))).toList(),
                        ),
                      ],
                      if (worker.bio != null && worker.bio!.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        Text(worker.bio!, style: theme.textTheme.bodyMedium),
                      ],
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.work_outline, size: 18, color: theme.colorScheme.outline),
                          const SizedBox(width: 8),
                          Text(l10n.workerExperienceYears(worker.experienceYears)),
                        ],
                      ),
                      if (worker.serviceAreas.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on_outlined, size: 18, color: theme.colorScheme.outline),
                            const SizedBox(width: 8),
                            Expanded(child: Text(worker.serviceAreas.join(', '))),
                          ],
                        ),
                      ],
                      if (worker.portfolioImages.isNotEmpty) ...[
                        const SizedBox(height: 20),
                        Text(l10n.workerPortfolioTitle, style: theme.textTheme.titleMedium),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 100,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: worker.portfolioImages.length,
                            separatorBuilder: (_, _) => const SizedBox(width: 8),
                            itemBuilder: (context, index) => ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                imageUrl: worker.portfolioImages[index],
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              label: l10n.workerOrderButton,
                              onPressed: () => _openOrderSheet(context, worker),
                            ),
                          ),
                          const SizedBox(width: 12),
                          OutlinedButton(
                            onPressed: () => _openChat(context, ref, worker),
                            child: Tooltip(
                              message: l10n.workerMessageButton,
                              child: const Icon(Icons.chat_bubble_outline),
                            ),
                          ),
                          if (worker.contactPhone != null) ...[
                            const SizedBox(width: 12),
                            OutlinedButton(
                              onPressed: () => _callWorker(context, worker.contactPhone!),
                              child: const Icon(Icons.phone_outlined),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(l10n.workerReviewsTitle, style: theme.textTheme.titleMedium),
                    ],
                  ),
                ),
              ),
              Consumer(
                builder: (context, ref, _) {
                  final reviews = ref.watch(workerReviewsProvider(workerId));
                  return reviews.when(
                    loading: () => const SliverToBoxAdapter(child: LoadingIndicator()),
                    error: (error, _) => SliverToBoxAdapter(
                      child: ErrorView(message: error is Failure ? error.message : error.toString()),
                    ),
                    data: (items) {
                      if (items.isEmpty) {
                        return SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: EmptyStateView(message: l10n.workerNoReviews),
                          ),
                        );
                      }
                      return SliverList.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) => ReviewTile(review: items[index]),
                      );
                    },
                  );
                },
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          );
        },
      ),
    );
  }
}
