import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../providers/admin_providers.dart';

class AdminHomeScreen extends ConsumerWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final authState = ref.watch(authStateChangesProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.adminPanelTitle)),
      body: authState.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (user) {
          if (user?.role != UserRole.admin) {
            return Center(child: Text(l10n.adminAccessDenied));
          }
          return const _AdminDashboard();
        },
      ),
    );
  }
}

class _AdminDashboard extends ConsumerWidget {
  const _AdminDashboard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final stats = ref.watch(adminStatsProvider);

    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(adminStatsProvider),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          stats.when(
            loading: () => const LoadingIndicator(),
            error: (error, _) => ErrorView(
              message: error is Failure ? error.message : error.toString(),
            ),
            data: (data) => GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _StatCard(
                  label: l10n.adminStatUsers,
                  value: data.userCount,
                  onTap: () => context.push('/admin/users'),
                ),
                _StatCard(
                  label: l10n.adminStatWorkers,
                  value: data.workerCount,
                  onTap: () => context.push('/admin/all-workers'),
                ),
                _StatCard(
                  label: l10n.adminStatPendingWorkers,
                  value: data.pendingWorkerCount,
                  highlight: data.pendingWorkerCount > 0,
                  onTap: () => context.push('/admin/workers'),
                ),
                _StatCard(
                  label: l10n.adminStatShops,
                  value: data.shopCount,
                  onTap: () => context.push('/admin/all-shops'),
                ),
                _StatCard(
                  label: l10n.adminStatPendingShops,
                  value: data.pendingShopCount,
                  highlight: data.pendingShopCount > 0,
                  onTap: () => context.push('/admin/shops'),
                ),
                _StatCard(
                  label: l10n.adminStatMaterials,
                  value: data.materialCount,
                  onTap: () => context.push('/materials'),
                ),
                _StatCard(
                  label: l10n.adminStatOrders,
                  value: data.orderCount,
                  onTap: () => context.push('/admin/orders'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _MenuTile(
            icon: Icons.category_outlined,
            label: l10n.adminMenuCategories,
            onTap: () => context.push('/admin/categories'),
          ),
          _MenuTile(
            icon: Icons.handyman_outlined,
            label: l10n.adminMenuPendingWorkers,
            onTap: () => context.push('/admin/workers'),
          ),
          _MenuTile(
            icon: Icons.storefront_outlined,
            label: l10n.adminMenuPendingShops,
            onTap: () => context.push('/admin/shops'),
          ),
          _MenuTile(
            icon: Icons.people_outline,
            label: l10n.adminMenuUsers,
            onTap: () => context.push('/admin/users'),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final int value;
  final bool highlight;
  final VoidCallback? onTap;

  const _StatCard({
    required this.label,
    required this.value,
    this.highlight = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: highlight ? theme.colorScheme.errorContainer : null,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$value', style: theme.textTheme.headlineSmall),
              const SizedBox(height: 4),
              Text(label, style: theme.textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MenuTile({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(label),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
