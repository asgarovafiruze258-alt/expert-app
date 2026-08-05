import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../providers/worker_providers.dart';
import '../widgets/worker_card.dart';

class WorkerListScreen extends ConsumerWidget {
  final String? categoryId;
  final String? categoryName;

  const WorkerListScreen({super.key, this.categoryId, this.categoryName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final workers = ref.watch(workersListProvider(categoryId));

    return Scaffold(
      appBar: AppBar(title: Text(categoryName ?? l10n.navWorkers)),
      body: workers.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (items) {
          if (items.isEmpty) return EmptyStateView(message: l10n.emptyWorkers);
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.72,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final worker = items[index];
              return WorkerCard(
                worker: worker,
                onTap: () => context.push('/workers/${worker.id}'),
              );
            },
          );
        },
      ),
    );
  }
}
