import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../home/presentation/providers/home_providers.dart';
import '../providers/worker_providers.dart';

class BecomeWorkerScreen extends ConsumerStatefulWidget {
  const BecomeWorkerScreen({super.key});

  @override
  ConsumerState<BecomeWorkerScreen> createState() => _BecomeWorkerScreenState();
}

class _BecomeWorkerScreenState extends ConsumerState<BecomeWorkerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _bioController = TextEditingController();
  final _experienceController = TextEditingController();
  final _priceFromController = TextEditingController();
  final _priceToController = TextEditingController();
  final _serviceAreasController = TextEditingController();
  final _phoneController = TextEditingController();
  final _selectedCategoryIds = <String>{};

  @override
  void dispose() {
    _bioController.dispose();
    _experienceController.dispose();
    _priceFromController.dispose();
    _priceToController.dispose();
    _serviceAreasController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context);
    final formOk = _formKey.currentState?.validate() ?? false;
    if (!formOk || _selectedCategoryIds.isEmpty) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l10n.becomeWorkerValidationError)));
      return;
    }

    final serviceAreas = _serviceAreasController.text
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    final success = await ref.read(becomeWorkerControllerProvider.notifier).submit(
          bio: _bioController.text.trim(),
          experienceYears: int.tryParse(_experienceController.text.trim()) ?? 0,
          priceFrom: double.tryParse(_priceFromController.text.trim()),
          priceTo: double.tryParse(_priceToController.text.trim()),
          serviceAreas: serviceAreas,
          contactPhone:
              _phoneController.text.trim().isEmpty ? null : _phoneController.text.trim(),
          categoryIds: _selectedCategoryIds.toList(),
        );
    if (!mounted) return;
    if (success) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l10n.becomeWorkerSuccess)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categoriesAsync = ref.watch(workerCategoriesProvider);

    ref.listen(becomeWorkerControllerProvider, (previous, next) {
      final error = next.error;
      if (error is Failure) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(error.message)));
      }
    });

    final isSubmitting = ref.watch(becomeWorkerControllerProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.becomeWorkerTitle)),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              AppTextField(
                controller: _bioController,
                label: l10n.becomeWorkerBioLabel,
                maxLines: 4,
                validator: (v) => (v == null || v.trim().isEmpty) ? '' : null,
              ),
              const SizedBox(height: 12),
              AppTextField(
                controller: _experienceController,
                label: l10n.becomeWorkerExperienceLabel,
                keyboardType: TextInputType.number,
                prefixIcon: Icons.workspace_premium_outlined,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: _priceFromController,
                      label: l10n.becomeWorkerPriceFromLabel,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppTextField(
                      controller: _priceToController,
                      label: l10n.becomeWorkerPriceToLabel,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              AppTextField(
                controller: _serviceAreasController,
                label: l10n.becomeWorkerServiceAreasLabel,
                prefixIcon: Icons.map_outlined,
              ),
              const SizedBox(height: 12),
              AppTextField(
                controller: _phoneController,
                label: l10n.becomeWorkerPhoneLabel,
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone_outlined,
              ),
              const SizedBox(height: 20),
              Text(l10n.becomeWorkerCategoriesLabel, style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              categoriesAsync.when(
                loading: () => const LoadingIndicator(),
                error: (error, _) => ErrorView(
                  message: error is Failure ? error.message : error.toString(),
                ),
                data: (categories) => Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: categories.map((category) {
                    final selected = _selectedCategoryIds.contains(category.id);
                    return FilterChip(
                      label: Text(category.name),
                      selected: selected,
                      onSelected: (value) {
                        setState(() {
                          if (value) {
                            _selectedCategoryIds.add(category.id);
                          } else {
                            _selectedCategoryIds.remove(category.id);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 24),
              AppButton(
                label: l10n.becomeWorkerSubmitButton,
                isLoading: isSubmitting,
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
