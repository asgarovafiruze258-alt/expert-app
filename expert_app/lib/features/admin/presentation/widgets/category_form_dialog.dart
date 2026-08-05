import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../home/domain/entities/category_entity.dart';
import '../providers/admin_providers.dart';

class CategoryFormDialog extends ConsumerStatefulWidget {
  final CategoryEntity? category;

  const CategoryFormDialog({super.key, this.category});

  @override
  ConsumerState<CategoryFormDialog> createState() => _CategoryFormDialogState();
}

class _CategoryFormDialogState extends ConsumerState<CategoryFormDialog> {
  late final _nameController = TextEditingController(text: widget.category?.name ?? '');
  late final _nameEnController = TextEditingController(text: widget.category?.nameEn ?? '');
  late final _nameRuController = TextEditingController(text: widget.category?.nameRu ?? '');
  late CategoryType _type = widget.category?.type ?? CategoryType.worker;

  @override
  void dispose() {
    _nameController.dispose();
    _nameEnController.dispose();
    _nameRuController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_nameController.text.trim().isEmpty) return;
    final controller = ref.read(categoryAdminControllerProvider.notifier);
    final success = widget.category == null
        ? await controller.create(
            name: _nameController.text.trim(),
            nameEn: _nameEnController.text.trim().isEmpty ? null : _nameEnController.text.trim(),
            nameRu: _nameRuController.text.trim().isEmpty ? null : _nameRuController.text.trim(),
            type: _type,
          )
        : await controller.updateCategory(
            id: widget.category!.id,
            name: _nameController.text.trim(),
            nameEn: _nameEnController.text.trim().isEmpty ? null : _nameEnController.text.trim(),
            nameRu: _nameRuController.text.trim().isEmpty ? null : _nameRuController.text.trim(),
          );
    if (!mounted) return;
    if (success) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isLoading = ref.watch(categoryAdminControllerProvider).isLoading;

    return AlertDialog(
      title: Text(widget.category == null ? l10n.adminAddCategory : l10n.adminEditCategory),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(controller: _nameController, label: l10n.adminCategoryNameLabel),
            const SizedBox(height: 12),
            AppTextField(controller: _nameEnController, label: l10n.adminCategoryNameEnLabel),
            const SizedBox(height: 12),
            AppTextField(controller: _nameRuController, label: l10n.adminCategoryNameRuLabel),
            if (widget.category == null) ...[
              const SizedBox(height: 12),
              DropdownButtonFormField<CategoryType>(
                initialValue: _type,
                decoration: InputDecoration(labelText: l10n.adminCategoryTypeLabel),
                items: [
                  DropdownMenuItem(
                    value: CategoryType.worker,
                    child: Text(l10n.adminCategoryTypeWorker),
                  ),
                  DropdownMenuItem(
                    value: CategoryType.material,
                    child: Text(l10n.adminCategoryTypeMaterial),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) setState(() => _type = value);
                },
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.projectCancelButton),
        ),
        FilledButton(
          onPressed: isLoading ? null : _submit,
          child: Text(l10n.projectSaveButton),
        ),
      ],
    );
  }
}
