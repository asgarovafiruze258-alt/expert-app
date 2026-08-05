import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../project/presentation/providers/project_providers.dart';
import '../providers/ai_providers.dart';

class BudgetEstimateSheet extends ConsumerStatefulWidget {
  final String projectId;

  const BudgetEstimateSheet({super.key, required this.projectId});

  @override
  ConsumerState<BudgetEstimateSheet> createState() => _BudgetEstimateSheetState();
}

class _BudgetEstimateSheetState extends ConsumerState<BudgetEstimateSheet> {
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _estimate() async {
    final text = _descriptionController.text.trim();
    if (text.isEmpty) return;
    await ref.read(budgetEstimateControllerProvider.notifier).estimate(text);
  }

  Future<void> _addAllToProject() async {
    final l10n = AppLocalizations.of(context);
    final estimate = ref.read(budgetEstimateControllerProvider).value;
    if (estimate == null) return;
    final controller = ref.read(projectItemControllerProvider.notifier);
    for (final item in estimate.items) {
      await controller.add(
        projectId: widget.projectId,
        itemType: item.itemType,
        label: item.label,
        estimatedCost: item.estimatedCost,
      );
    }
    if (!mounted) return;
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(l10n.aiBudgetAddedSuccess)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final estimateState = ref.watch(budgetEstimateControllerProvider);

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(context).viewInsets.bottom + 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.aiBudgetEstimateTitle, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          AppTextField(
            controller: _descriptionController,
            label: l10n.aiBudgetDescriptionHint,
            prefixIcon: Icons.auto_awesome,
          ),
          const SizedBox(height: 16),
          AppButton(
            label: l10n.aiBudgetEstimateSubmit,
            isLoading: estimateState.isLoading,
            onPressed: _estimate,
          ),
          const SizedBox(height: 16),
          estimateState.when(
            loading: () => const SizedBox.shrink(),
            error: (error, _) => Text(
              error is Failure ? error.message : error.toString(),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            data: (estimate) {
              if (estimate == null) return const SizedBox.shrink();
              final theme = Theme.of(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.aiBudgetResultTitle, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(
                    '${estimate.estimatedBudget.toStringAsFixed(0)}₼',
                    style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  for (final item in estimate.items)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(item.label)),
                          Text('${item.estimatedCost.toStringAsFixed(0)}₼'),
                        ],
                      ),
                    ),
                  const SizedBox(height: 16),
                  AppButton(
                    label: l10n.aiBudgetAddAllButton,
                    onPressed: _addAllToProject,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
