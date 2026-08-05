import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../providers/auth_providers.dart';

class EditProfileSheet extends ConsumerStatefulWidget {
  final String initialFullName;
  final String? initialPhone;
  final DateTime? initialDateOfBirth;

  const EditProfileSheet({
    super.key,
    required this.initialFullName,
    this.initialPhone,
    this.initialDateOfBirth,
  });

  @override
  ConsumerState<EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends ConsumerState<EditProfileSheet> {
  late final _nameController = TextEditingController(text: widget.initialFullName);
  late final _phoneController = TextEditingController(text: widget.initialPhone ?? '');
  late final _dobController = TextEditingController(text: _formatDate(widget.initialDateOfBirth));
  DateTime? _dateOfBirth;

  @override
  void initState() {
    super.initState();
    _dateOfBirth = widget.initialDateOfBirth;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  static String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day.toString().padLeft(2, '0')}.'
        '${date.month.toString().padLeft(2, '0')}.'
        '${date.year}';
  }

  Future<void> _pickDateOfBirth() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dateOfBirth ?? DateTime(now.year - 25),
      firstDate: DateTime(now.year - 120),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        _dateOfBirth = picked;
        _dobController.text = _formatDate(picked);
      });
    }
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context);
    final fullName = _nameController.text.trim();
    if (fullName.isEmpty) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l10n.editProfileValidationError)));
      return;
    }

    final success = await ref.read(editProfileControllerProvider.notifier).updateProfile(
          fullName: fullName,
          phone: _phoneController.text.trim().isEmpty ? null : _phoneController.text.trim(),
          dateOfBirth: _dateOfBirth,
        );
    if (!mounted) return;
    if (success) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l10n.editProfileSuccess)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    ref.listen(editProfileControllerProvider, (previous, next) {
      final error = next.error;
      if (error is Failure) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(error.message)));
      }
    });

    final isLoading = ref.watch(editProfileControllerProvider).isLoading;

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(context).viewInsets.bottom + 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.editProfileTitle, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          AppTextField(
            controller: _nameController,
            label: l10n.editProfileNameLabel,
            prefixIcon: Icons.person_outline,
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _phoneController,
            label: l10n.editProfilePhoneLabel,
            keyboardType: TextInputType.phone,
            prefixIcon: Icons.phone_outlined,
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _dobController,
            label: l10n.editProfileDateOfBirthLabel,
            prefixIcon: Icons.cake_outlined,
            readOnly: true,
            onTap: _pickDateOfBirth,
          ),
          const SizedBox(height: 20),
          AppButton(
            label: l10n.editProfileSaveButton,
            isLoading: isLoading,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
