import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/project_item_entity.dart';
import '../providers/project_providers.dart';

class AddProjectItemSheet extends ConsumerStatefulWidget {
  final String projectId;

  const AddProjectItemSheet({super.key, required this.projectId});

  @override
  ConsumerState<AddProjectItemSheet> createState() => _AddProjectItemSheetState();
}

class _AddProjectItemSheetState extends ConsumerState<AddProjectItemSheet> {
  final _labelController = TextEditingController();
  final _estimatedCostController = TextEditingController();
  ProjectItemType _itemType = ProjectItemType.work;

  @override
  void dispose() {
    _labelController.dispose();
    _estimatedCostController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_labelController.text.trim().isEmpty) return;

    final success = await ref.read(projectItemControllerProvider.notifier).add(
          projectId: widget.projectId,
          itemType: _itemType,
          label: _labelController.text.trim(),
          estimatedCost: double.tryParse(_estimatedCostController.text.trim()) ?? 0,
        );
    if (!mounted) return;
    if (success) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    ref.listen(projectItemControllerProvider, (previous, next) {
      final error = next.error;
      if (error is Failure) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(error.message)));
      }
    });

    final isLoading = ref.watch(projectItemControllerProvider).isLoading;

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(context).viewInsets.bottom + 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.projectAddItemTitle, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          SegmentedButton<ProjectItemType>(
            segments: [
              ButtonSegment(value: ProjectItemType.work, label: Text(l10n.projectItemTypeWork)),
              ButtonSegment(
                  value: ProjectItemType.material, label: Text(l10n.projectItemTypeMaterial)),
              ButtonSegment(value: ProjectItemType.worker, label: Text(l10n.projectItemTypeWorker)),
            ],
            selected: {_itemType},
            onSelectionChanged: (selection) => setState(() => _itemType = selection.first),
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _labelController,
            label: l10n.projectItemLabelField,
            prefixIcon: Icons.label_outline,
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _estimatedCostController,
            label: l10n.projectItemEstimatedCostField,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            prefixIcon: Icons.payments_outlined,
          ),
          const SizedBox(height: 20),
          AppButton(
            label: l10n.projectAddItemButton,
            isLoading: isLoading,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
