import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/theme_provider.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/language_switcher.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../ai/presentation/widgets/ai_assistant_banner.dart';
import '../../../material/presentation/widgets/material_card.dart';
import '../../../notification/presentation/widgets/notification_bell_button.dart';
import '../../../order/presentation/widgets/cart_icon_button.dart';
import '../../../worker/presentation/widgets/worker_card.dart';
import '../../domain/entities/recently_viewed_entity.dart';
import '../providers/home_providers.dart';
import '../widgets/category_chip.dart';
import '../widgets/promo_banner.dart';
import '../widgets/section_header.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  Future<void> _recordView(WidgetRef ref, RecentlyViewedEntity entry) async {
    await ref.read(homeRepositoryProvider).addRecentlyViewed(entry);
    ref.invalidate(recentlyViewedProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.homeAppBarBackground,
        foregroundColor: AppColors.onHomeAppBarBackground,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode_outlined),
          tooltip: l10n.themeToggleLabel,
          onPressed: () => ref
              .read(themeModeProvider.notifier)
              .setThemeMode(isDark ? ThemeMode.light : ThemeMode.dark),
        ),
        title: Text(
          l10n.appName,
          style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary),
        ),
        actions: const [LanguageSwitcher()],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chat_bubble_outline),
                  onPressed: () => context.push('/chats'),
                ),
                const NotificationBellButton(),
                const CartIconButton(),
              ],
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(workerCategoriesProvider);
          ref.invalidate(popularWorkersProvider);
          ref.invalidate(popularMaterialsProvider);
          ref.invalidate(discountedMaterialsProvider);
          ref.invalidate(recentlyViewedProvider);
        },
        child: ListView(
          padding: const EdgeInsets.only(bottom: 24),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: _SearchBox(hint: l10n.searchHint),
            ),
            PromoBanner(title: l10n.promoBannerTitle, subtitle: l10n.promoBannerSubtitle),
            const SizedBox(height: 12),
            const AiAssistantBanner(),

            SectionHeader(title: l10n.sectionCategories),
            SizedBox(
              height: 116,
              child: Consumer(
                builder: (context, ref, _) {
                  final categories = ref.watch(workerCategoriesProvider);
                  return categories.when(
                    loading: () => const LoadingIndicator(),
                    error: (error, _) => ErrorView(
                      message: error is Failure ? error.message : error.toString(),
                    ),
                    data: (items) {
                      if (items.isEmpty) return EmptyStateView(message: l10n.emptyCategories);
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: items.length,
                        separatorBuilder: (_, _) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final category = items[index];
                          return CategoryChip(
                            category: category,
                            onTap: () => context.push(
                              '/workers',
                              extra: {'categoryId': category.id, 'categoryName': category.name},
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),

            SectionHeader(title: l10n.sectionPopularWorkers),
            SizedBox(
              height: 210,
              child: Consumer(
                builder: (context, ref, _) {
                  final workers = ref.watch(popularWorkersProvider);
                  return workers.when(
                    loading: () => const LoadingIndicator(),
                    error: (error, _) => ErrorView(
                      message: error is Failure ? error.message : error.toString(),
                    ),
                    data: (items) {
                      if (items.isEmpty) return EmptyStateView(message: l10n.emptyWorkers);
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: items.length,
                        separatorBuilder: (_, _) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final worker = items[index];
                          return SizedBox(
                            width: 160,
                            child: WorkerCard(
                              worker: worker,
                              onTap: () {
                                _recordView(
                                  ref,
                                  RecentlyViewedEntity(
                                    type: RecentlyViewedType.worker,
                                    id: worker.id,
                                    title: worker.fullName,
                                    imageUrl: worker.avatarUrl,
                                    viewedAt: DateTime.now(),
                                  ),
                                );
                                context.push('/workers/${worker.id}');
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),

            SectionHeader(title: l10n.sectionPopularMaterials),
            SizedBox(
              height: 210,
              child: Consumer(
                builder: (context, ref, _) {
                  final materials = ref.watch(popularMaterialsProvider);
                  return materials.when(
                    loading: () => const LoadingIndicator(),
                    error: (error, _) => ErrorView(
                      message: error is Failure ? error.message : error.toString(),
                    ),
                    data: (items) {
                      if (items.isEmpty) return EmptyStateView(message: l10n.emptyMaterials);
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: items.length,
                        separatorBuilder: (_, _) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final material = items[index];
                          return SizedBox(
                            width: 160,
                            child: MaterialCard(
                              material: material,
                              onTap: () {
                                _recordView(
                                  ref,
                                  RecentlyViewedEntity(
                                    type: RecentlyViewedType.material,
                                    id: material.id,
                                    title: material.name,
                                    imageUrl:
                                        material.images.isNotEmpty ? material.images.first : null,
                                    viewedAt: DateTime.now(),
                                  ),
                                );
                                context.push('/materials/${material.id}');
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),

            SectionHeader(title: l10n.sectionDiscounts),
            SizedBox(
              height: 210,
              child: Consumer(
                builder: (context, ref, _) {
                  final materials = ref.watch(discountedMaterialsProvider);
                  return materials.when(
                    loading: () => const LoadingIndicator(),
                    error: (error, _) => ErrorView(
                      message: error is Failure ? error.message : error.toString(),
                    ),
                    data: (items) {
                      if (items.isEmpty) return EmptyStateView(message: l10n.emptyDiscounts);
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: items.length,
                        separatorBuilder: (_, _) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final material = items[index];
                          return SizedBox(
                            width: 160,
                            child: MaterialCard(
                              material: material,
                              onTap: () {
                                _recordView(
                                  ref,
                                  RecentlyViewedEntity(
                                    type: RecentlyViewedType.material,
                                    id: material.id,
                                    title: material.name,
                                    imageUrl:
                                        material.images.isNotEmpty ? material.images.first : null,
                                    viewedAt: DateTime.now(),
                                  ),
                                );
                                context.push('/materials/${material.id}');
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),

            SectionHeader(title: l10n.sectionRecentlyViewed),
            Consumer(
              builder: (context, ref, _) {
                final recent = ref.watch(recentlyViewedProvider);
                return recent.when(
                  loading: () => const SizedBox(height: 80, child: LoadingIndicator()),
                  error: (error, _) => ErrorView(
                    message: error is Failure ? error.message : error.toString(),
                  ),
                  data: (items) {
                    if (items.isEmpty) {
                      return EmptyStateView(
                        message: l10n.emptyRecentlyViewed,
                        icon: Icons.history,
                      );
                    }
                    return SizedBox(
                      height: 80,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: items.length,
                        separatorBuilder: (_, _) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return _RecentlyViewedChip(item: item);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 1) {
            context.push('/workers');
            return;
          }
          if (index == 2) {
            context.push('/materials');
            return;
          }
          if (index == 3) {
            context.push('/projects');
            return;
          }
          if (index == 4) {
            context.push('/profile');
            return;
          }
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(l10n.comingSoon)));
        },
        destinations: [
          NavigationDestination(icon: const Icon(Icons.home_outlined), label: l10n.navHome),
          NavigationDestination(icon: const Icon(Icons.handyman_outlined), label: l10n.navWorkers),
          NavigationDestination(icon: const Icon(Icons.inventory_2_outlined), label: l10n.navMaterials),
          NavigationDestination(icon: const Icon(Icons.folder_outlined), label: l10n.navProjects),
          NavigationDestination(icon: const Icon(Icons.person_outline), label: l10n.navProfile),
        ],
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  final String hint;

  const _SearchBox({required this.hint});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => context.push('/search'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.dividerColor),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: theme.colorScheme.outline),
            const SizedBox(width: 8),
            Text(hint, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.outline)),
          ],
        ),
      ),
    );
  }
}

class _RecentlyViewedChip extends StatelessWidget {
  final RecentlyViewedEntity item;

  const _RecentlyViewedChip({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints(maxWidth: 160),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            item.type == RecentlyViewedType.worker
                ? Icons.handyman_outlined
                : Icons.inventory_2_outlined,
            size: 18,
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
