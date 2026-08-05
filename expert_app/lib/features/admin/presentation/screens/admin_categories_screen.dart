import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../home/domain/entities/category_entity.dart';
import '../providers/admin_providers.dart';
import '../widgets/category_form_dialog.dart';

class AdminCategoriesScreen extends ConsumerWidget {
  const AdminCategoriesScreen({super.key});

  void _openForm(BuildContext context, {CategoryEntity? category}) {
    showDialog(
      context: context,
      builder: (context) => CategoryFormDialog(category: category),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, CategoryEntity category) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.adminDeleteCategoryConfirmTitle),
        content: Text(category.name),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.projectCancelButton),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.projectDeleteConfirmButton),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(categoryAdminControllerProvider.notifier).delete(category.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final categories = ref.watch(allCategoriesProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.adminMenuCategories)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openForm(context),
        child: const Icon(Icons.add),
      ),
      body: categories.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (items) {
          if (items.isEmpty) return EmptyStateView(message: l10n.emptyCategories);
          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final category = items[index];
              return ListTile(
                leading: Icon(
                  category.type == CategoryType.worker
                      ? Icons.handyman_outlined
                      : Icons.inventory_2_outlined,
                ),
                title: Text(category.name),
                subtitle: Text(
                  category.type == CategoryType.worker
                      ? l10n.adminCategoryTypeWorker
                      : l10n.adminCategoryTypeMaterial,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit_outlined),
                      onPressed: () => _openForm(context, category: category),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => _confirmDelete(context, ref, category),
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
