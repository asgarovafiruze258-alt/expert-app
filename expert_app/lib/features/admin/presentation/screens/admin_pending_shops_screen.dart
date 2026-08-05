import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../providers/admin_providers.dart';

class AdminPendingShopsScreen extends ConsumerWidget {
  const AdminPendingShopsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final shops = ref.watch(pendingShopsProvider);
    final isLoading = ref.watch(shopApprovalControllerProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.adminMenuPendingShops)),
      body: shops.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (items) {
          if (items.isEmpty) {
            return EmptyStateView(message: l10n.adminNoPendingShops, icon: Icons.storefront_outlined);
          }
          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final shop = items[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      shop.logoUrl != null ? CachedNetworkImageProvider(shop.logoUrl!) : null,
                  child: shop.logoUrl == null ? const Icon(Icons.storefront_outlined) : null,
                ),
                title: Text(shop.name),
                subtitle: Text([shop.address, shop.rayon].whereType<String>().join(', ')),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.red),
                      tooltip: l10n.adminRejectButton,
                      onPressed: isLoading
                          ? null
                          : () => ref.read(shopApprovalControllerProvider.notifier).reject(shop.id),
                    ),
                    IconButton(
                      icon: const Icon(Icons.check, color: Colors.green),
                      tooltip: l10n.adminApproveButton,
                      onPressed: isLoading
                          ? null
                          : () => ref.read(shopApprovalControllerProvider.notifier).approve(shop.id),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
