import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../material/presentation/widgets/material_card.dart';
import '../providers/shop_providers.dart';

class ShopDetailScreen extends ConsumerWidget {
  final String shopId;

  const ShopDetailScreen({super.key, required this.shopId});

  Future<void> _callShop(String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final shopAsync = ref.watch(shopDetailProvider(shopId));

    return Scaffold(
      body: shopAsync.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (shop) {
          final theme = Theme.of(context);
          return CustomScrollView(
            slivers: [
              SliverAppBar(pinned: true, title: Text(shop.name)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundColor: theme.colorScheme.surfaceContainerHighest,
                            backgroundImage:
                                shop.logoUrl != null ? CachedNetworkImageProvider(shop.logoUrl!) : null,
                            child: shop.logoUrl == null ? const Icon(Icons.storefront_outlined) : null,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(shop.name, style: theme.textTheme.titleLarge),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.star, size: 16, color: Colors.amber),
                                    const SizedBox(width: 4),
                                    Text(shop.rating.toStringAsFixed(1)),
                                  ],
                                ),
                                if (shop.address != null || shop.rayon != null) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    [shop.address, shop.rayon].whereType<String>().join(', '),
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ],
                            ),
                          ),
                          if (shop.contactPhone != null) ...[
                            const SizedBox(width: 12),
                            OutlinedButton(
                              onPressed: () => _callShop(shop.contactPhone!),
                              child: const Icon(Icons.phone_outlined),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(l10n.shopProductsTitle, style: theme.textTheme.titleMedium),
                    ],
                  ),
                ),
              ),
              Consumer(
                builder: (context, ref, _) {
                  final materials = ref.watch(shopMaterialsProvider(shopId));
                  return materials.when(
                    loading: () => const SliverToBoxAdapter(child: LoadingIndicator()),
                    error: (error, _) => SliverToBoxAdapter(
                      child: ErrorView(message: error is Failure ? error.message : error.toString()),
                    ),
                    data: (items) {
                      if (items.isEmpty) {
                        return SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: EmptyStateView(message: l10n.emptyMaterials),
                          ),
                        );
                      }
                      return SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        sliver: SliverGrid(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.68,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => MaterialCard(
                              material: items[index],
                              onTap: () => context.push('/materials/${items[index].id}'),
                            ),
                            childCount: items.length,
                          ),
                        ),
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
