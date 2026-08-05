import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/project_item_entity.dart';
import '../providers/project_providers.dart';

IconData _iconForType(ProjectItemType type) {
  return switch (type) {
    ProjectItemType.work => Icons.build_outlined,
    ProjectItemType.material => Icons.inventory_2_outlined,
    ProjectItemType.worker => Icons.handyman_outlined,
  };
}

class ProjectItemTile extends ConsumerWidget {
  final ProjectItemEntity item;

  const ProjectItemTile({super.key, required this.item});

  Future<void> _editActualCost(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final controller = TextEditingController(text: item.actualCost?.toStringAsFixed(0) ?? '');
    final value = await showDialog<double>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.projectSetActualCostTitle),
        content: AppTextField(
          controller: controller,
          label: l10n.projectItemActualCostField,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.projectCancelButton),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(double.tryParse(controller.text.trim())),
            child: Text(l10n.projectSaveButton),
          ),
        ],
      ),
    );
    if (value == null) return;
    await ref.read(projectItemControllerProvider.notifier).updateActualCost(
          id: item.id,
          projectId: item.projectId,
          actualCost: value,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return ListTile(
      leading: CircleAvatar(child: Icon(_iconForType(item.itemType))),
      title: Text(item.label),
      subtitle: Text(
        item.actualCost != null
            ? '${item.estimatedCost.toStringAsFixed(0)}₼ → ${item.actualCost!.toStringAsFixed(0)}₼'
            : '${item.estimatedCost.toStringAsFixed(0)}₼',
        style: theme.textTheme.bodySmall,
      ),
      onTap: () => _editActualCost(context, ref),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () => ref
            .read(projectItemControllerProvider.notifier)
            .remove(id: item.id, projectId: item.projectId),
      ),
    );
  }
}
