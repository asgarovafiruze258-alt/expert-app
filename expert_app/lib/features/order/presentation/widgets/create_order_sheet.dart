import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/order_entity.dart';
import '../providers/order_providers.dart';

class CreateOrderSheet extends ConsumerStatefulWidget {
  final OrderTargetType targetType;
  final String targetId;

  const CreateOrderSheet({super.key, required this.targetType, required this.targetId});

  @override
  ConsumerState<CreateOrderSheet> createState() => _CreateOrderSheetState();
}

class _CreateOrderSheetState extends ConsumerState<CreateOrderSheet> {
  final _addressController = TextEditingController();
  final _notesController = TextEditingController();
  DateTime? _scheduledDate;

  @override
  void dispose() {
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now.add(const Duration(days: 1)),
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );
    if (picked != null) setState(() => _scheduledDate = picked);
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context);
    final success = await ref.read(createOrderControllerProvider.notifier).submit(
          targetType: widget.targetType,
          targetId: widget.targetId,
          address: _addressController.text.trim().isEmpty ? null : _addressController.text.trim(),
          scheduledDate: _scheduledDate,
          notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        );
    if (!mounted) return;
    if (success) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l10n.orderCreatedSuccess)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    ref.listen(createOrderControllerProvider, (previous, next) {
      final error = next.error;
      if (error is Failure) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(error.message)));
      }
    });

    final isLoading = ref.watch(createOrderControllerProvider).isLoading;

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(context).viewInsets.bottom + 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.orderSheetTitle, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          AppTextField(
            controller: _addressController,
            label: l10n.orderAddressLabel,
            prefixIcon: Icons.location_on_outlined,
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _pickDate,
            icon: const Icon(Icons.calendar_today_outlined),
            label: Text(
              _scheduledDate == null
                  ? l10n.orderPickDate
                  : '${_scheduledDate!.day}.${_scheduledDate!.month}.${_scheduledDate!.year}',
            ),
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _notesController,
            label: l10n.orderNotesLabel,
            prefixIcon: Icons.notes_outlined,
          ),
          const SizedBox(height: 20),
          AppButton(
            label: l10n.orderSubmitButton,
            isLoading: isLoading,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
