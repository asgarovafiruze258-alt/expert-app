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

class AdminAllWorkersScreen extends ConsumerWidget {
  const AdminAllWorkersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final workers = ref.watch(allWorkersAdminProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.adminMenuAllWorkers)),
      body: workers.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (items) {
          if (items.isEmpty) {
            return EmptyStateView(message: l10n.adminNoWorkers, icon: Icons.handyman_outlined);
          }
          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final worker = items[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      worker.avatarUrl != null ? CachedNetworkImageProvider(worker.avatarUrl!) : null,
                  child: worker.avatarUrl == null
                      ? Text(worker.fullName.isNotEmpty ? worker.fullName[0].toUpperCase() : '?')
                      : null,
                ),
                title: Text(worker.fullName),
                subtitle: Text(worker.categoryNames.join(', ')),
                trailing: Chip(
                  label: Text(worker.isApproved ? l10n.adminApprovedLabel : l10n.adminPendingLabel),
                  backgroundColor: worker.isApproved
                      ? Colors.green.withValues(alpha: 0.15)
                      : Colors.orange.withValues(alpha: 0.15),
                ),
                onTap: () => context.push('/workers/${worker.id}'),
              );
            },
          );
        },
      ),
    );
  }
}
