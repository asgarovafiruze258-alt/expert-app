import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../providers/admin_providers.dart';

class AdminPendingWorkersScreen extends ConsumerWidget {
  const AdminPendingWorkersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final workers = ref.watch(pendingWorkersProvider);
    final isLoading = ref.watch(workerApprovalControllerProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.adminMenuPendingWorkers)),
      body: workers.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (items) {
          if (items.isEmpty) {
            return EmptyStateView(message: l10n.adminNoPendingWorkers, icon: Icons.handyman_outlined);
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
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.red),
                      tooltip: l10n.adminRejectButton,
                      onPressed: isLoading
                          ? null
                          : () => ref.read(workerApprovalControllerProvider.notifier).reject(worker.id),
                    ),
                    IconButton(
                      icon: const Icon(Icons.check, color: Colors.green),
                      tooltip: l10n.adminApproveButton,
                      onPressed: isLoading
                          ? null
                          : () => ref.read(workerApprovalControllerProvider.notifier).approve(worker.id),
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
