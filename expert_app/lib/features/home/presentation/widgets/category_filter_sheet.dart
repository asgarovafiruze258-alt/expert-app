import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/category_entity.dart';
import '../providers/home_providers.dart';

class CategoryFilterSheet extends ConsumerStatefulWidget {
  const CategoryFilterSheet({super.key});

  @override
  ConsumerState<CategoryFilterSheet> createState() => _CategoryFilterSheetState();
}

class _CategoryFilterSheetState extends ConsumerState<CategoryFilterSheet> {
  CategoryType _type = CategoryType.worker;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categoriesAsync =
        ref.watch(_type == CategoryType.worker ? workerCategoriesProvider : materialCategoriesProvider);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    l10n.filterSheetTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SegmentedButton<CategoryType>(
                segments: [
                  ButtonSegment(value: CategoryType.worker, label: Text(l10n.navWorkers)),
                  ButtonSegment(value: CategoryType.material, label: Text(l10n.navMaterials)),
                ],
                selected: {_type},
                onSelectionChanged: (selection) => setState(() => _type = selection.first),
              ),
            ),
            const SizedBox(height: 12),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 340),
              child: categoriesAsync.when(
                loading: () => const Padding(
                  padding: EdgeInsets.all(24),
                  child: LoadingIndicator(),
                ),
                error: (error, _) => Padding(
                  padding: const EdgeInsets.all(24),
                  child: ErrorView(message: error is Failure ? error.message : error.toString()),
                ),
                data: (items) {
                  if (items.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(24),
                      child: EmptyStateView(message: l10n.emptyCategories),
                    );
                  }
                  return SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: items.map((category) {
                        return ActionChip(
                          label: Text(category.name),
                          onPressed: () {
                            Navigator.of(context).pop();
                            context.push(
                              _type == CategoryType.worker ? '/workers' : '/materials',
                              extra: {'categoryId': category.id, 'categoryName': category.name},
                            );
                          },
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
