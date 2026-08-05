import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../material/presentation/widgets/material_card.dart';
import '../../../worker/presentation/widgets/worker_card.dart';
import '../providers/favorite_providers.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final workers = ref.watch(favoriteWorkersProvider);
    final materials = ref.watch(favoriteMaterialsProvider);

    final isLoading = workers.isLoading || materials.isLoading;
    final error = workers.error ?? materials.error;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.favoritesTitle)),
      body: isLoading
          ? const LoadingIndicator()
          : error != null
              ? ErrorView(message: error is Failure ? error.message : error.toString())
              : Builder(
                  builder: (context) {
                    final workerItems = workers.value ?? const [];
                    final materialItems = materials.value ?? const [];
                    if (workerItems.isEmpty && materialItems.isEmpty) {
                      return EmptyStateView(
                        message: l10n.favoritesEmpty,
                        icon: Icons.favorite_border,
                      );
                    }
                    return ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        if (workerItems.isNotEmpty) ...[
                          Text(l10n.navWorkers, style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(height: 12),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 0.72,
                            ),
                            itemCount: workerItems.length,
                            itemBuilder: (context, index) => WorkerCard(
                              worker: workerItems[index],
                              onTap: () => context.push('/workers/${workerItems[index].id}'),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                        if (materialItems.isNotEmpty) ...[
                          Text(l10n.navMaterials, style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(height: 12),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 0.68,
                            ),
                            itemCount: materialItems.length,
                            itemBuilder: (context, index) => MaterialCard(
                              material: materialItems[index],
                              onTap: () => context.push('/materials/${materialItems[index].id}'),
                            ),
                          ),
                        ],
                      ],
                    );
                  },
                ),
    );
  }
}
