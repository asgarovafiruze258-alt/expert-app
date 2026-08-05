import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../shop/presentation/providers/shop_providers.dart';
import '../../../worker/presentation/providers/worker_providers.dart';
import '../../domain/entities/user_entity.dart';
import '../providers/auth_providers.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _isLoggingOut = false;

  Future<void> _logout() async {
    setState(() => _isLoggingOut = true);
    final result = await ref.read(authRepositoryProvider).logout();
    if (!mounted) return;
    setState(() => _isLoggingOut = false);
    result.fold(
      (failure) => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(failure.message))),
      (_) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final authState = ref.watch(authStateChangesProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.profileTitle)),
      body: authState.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (user) {
          if (user == null) return const SizedBox.shrink();
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Text(
                      user.fullName.isNotEmpty ? user.fullName[0].toUpperCase() : '?',
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user.fullName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  if (user.email != null)
                    Text(user.email!, textAlign: TextAlign.center),
                  if (user.phone != null)
                    Text(user.phone!, textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  Text(
                    l10n.profileEditComingSoon,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: () => context.push('/favorites'),
                    icon: const Icon(Icons.favorite_border),
                    label: Text(l10n.profileFavoritesLink),
                  ),
                  if (user.role != UserRole.admin) ...[
                    const SizedBox(height: 8),
                    _WorkerProfileSection(l10n: l10n),
                    const SizedBox(height: 8),
                    _ShopSection(l10n: l10n),
                  ],
                  if (user.role == UserRole.admin) ...[
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                      onPressed: () => context.push('/admin'),
                      icon: const Icon(Icons.admin_panel_settings_outlined),
                      label: Text(l10n.profileAdminPanelLink),
                    ),
                  ],
                  const Spacer(),
                  OutlinedButton.icon(
                    onPressed: _isLoggingOut ? null : _logout,
                    icon: const Icon(Icons.logout),
                    label: Text(l10n.profileLogout),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _WorkerProfileSection extends ConsumerWidget {
  final AppLocalizations l10n;

  const _WorkerProfileSection({required this.l10n});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workerProfileAsync = ref.watch(myWorkerProfileProvider);

    return workerProfileAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
      data: (workerProfile) {
        if (workerProfile == null) {
          return OutlinedButton.icon(
            onPressed: () => context.push('/become-worker'),
            icon: const Icon(Icons.handyman_outlined),
            label: Text(l10n.profileBecomeWorkerLink),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                workerProfile.isApproved ? Icons.verified_outlined : Icons.hourglass_top_outlined,
                size: 18,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 6),
              Text(
                workerProfile.isApproved
                    ? l10n.profileWorkerStatusApproved
                    : l10n.profileWorkerStatusPending,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ShopSection extends ConsumerWidget {
  final AppLocalizations l10n;

  const _ShopSection({required this.l10n});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopAsync = ref.watch(myShopProvider);

    return shopAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
      data: (shop) {
        if (shop == null) {
          return OutlinedButton.icon(
            onPressed: () => context.push('/open-shop'),
            icon: const Icon(Icons.storefront_outlined),
            label: Text(l10n.profileOpenShopLink),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                shop.isApproved ? Icons.verified_outlined : Icons.hourglass_top_outlined,
                size: 18,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 6),
              Text(
                shop.isApproved ? l10n.profileShopStatusApproved : l10n.profileShopStatusPending,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        );
      },
    );
  }
}
