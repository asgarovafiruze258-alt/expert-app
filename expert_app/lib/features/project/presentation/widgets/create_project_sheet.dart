import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../providers/project_providers.dart';

class CreateProjectSheet extends ConsumerStatefulWidget {
  const CreateProjectSheet({super.key});

  @override
  ConsumerState<CreateProjectSheet> createState() => _CreateProjectSheetState();
}

class _CreateProjectSheetState extends ConsumerState<CreateProjectSheet> {
  final _titleController = TextEditingController();
  final _roomCountController = TextEditingController();
  final _budgetController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _roomCountController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context);
    if (_titleController.text.trim().isEmpty) return;

    final success = await ref.read(projectControllerProvider.notifier).create(
          title: _titleController.text.trim(),
          roomCount: int.tryParse(_roomCountController.text.trim()),
          budgetPlanned: double.tryParse(_budgetController.text.trim()),
        );
    if (!mounted) return;
    if (success) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l10n.projectCreatedSuccess)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    ref.listen(projectControllerProvider, (previous, next) {
      final error = next.error;
      if (error is Failure) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(error.message)));
      }
    });

    final isLoading = ref.watch(projectControllerProvider).isLoading;

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(context).viewInsets.bottom + 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.projectCreateTitle, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          AppTextField(
            controller: _titleController,
            label: l10n.projectTitleLabel,
            prefixIcon: Icons.folder_outlined,
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _roomCountController,
            label: l10n.projectRoomCountLabel,
            keyboardType: TextInputType.number,
            prefixIcon: Icons.door_front_door_outlined,
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _budgetController,
            label: l10n.projectBudgetLabel,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            prefixIcon: Icons.savings_outlined,
          ),
          const SizedBox(height: 20),
          AppButton(
            label: l10n.projectCreateButton,
            isLoading: isLoading,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
