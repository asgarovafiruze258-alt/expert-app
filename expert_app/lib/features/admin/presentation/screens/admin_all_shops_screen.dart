import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../providers/admin_providers.dart';

class AdminAllShopsScreen extends ConsumerWidget {
  const AdminAllShopsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final shops = ref.watch(allShopsAdminProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.adminMenuAllShops)),
      body: shops.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (items) {
          if (items.isEmpty) {
            return EmptyStateView(message: l10n.adminNoShops, icon: Icons.storefront_outlined);
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
                trailing: Chip(
                  label: Text(shop.isApproved ? l10n.adminApprovedLabel : l10n.adminPendingLabel),
                  backgroundColor: shop.isApproved
                      ? Colors.green.withValues(alpha: 0.15)
                      : Colors.orange.withValues(alpha: 0.15),
                ),
                onTap: () => context.push('/shops/${shop.id}'),
              );
            },
          );
        },
      ),
    );
  }
}
