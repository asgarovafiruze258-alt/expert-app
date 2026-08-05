import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../home/presentation/providers/home_providers.dart';
import '../providers/shop_providers.dart';
import 'shop_location_picker_screen.dart';

class OpenShopScreen extends ConsumerStatefulWidget {
  const OpenShopScreen({super.key});

  @override
  ConsumerState<OpenShopScreen> createState() => _OpenShopScreenState();
}

class _OpenShopScreenState extends ConsumerState<OpenShopScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _rayonController = TextEditingController();
  final _phoneController = TextEditingController();
  final _selectedCategoryIds = <String>{};
  double? _pickedLatitude;
  double? _pickedLongitude;

  Future<void> _pickOnMap() async {
    final result = await Navigator.of(context).push<ShopLocationResult>(
      MaterialPageRoute(builder: (context) => const ShopLocationPickerScreen()),
    );
    if (result == null || !mounted) return;
    setState(() {
      _addressController.text = result.address;
      _pickedLatitude = result.latitude;
      _pickedLongitude = result.longitude;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _rayonController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context);
    final formOk = _formKey.currentState?.validate() ?? false;
    if (!formOk) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l10n.openShopValidationError)));
      return;
    }

    final success = await ref.read(openShopControllerProvider.notifier).submit(
          name: _nameController.text.trim(),
          address: _addressController.text.trim().isEmpty ? null : _addressController.text.trim(),
          rayon: _rayonController.text.trim().isEmpty ? null : _rayonController.text.trim(),
          latitude: _pickedLatitude,
          longitude: _pickedLongitude,
          contactPhone: _phoneController.text.trim().isEmpty ? null : _phoneController.text.trim(),
          categoryIds: _selectedCategoryIds.toList(),
        );
    if (!mounted) return;
    if (success) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l10n.openShopSuccess)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categoriesAsync = ref.watch(materialCategoriesProvider);

    ref.listen(openShopControllerProvider, (previous, next) {
      final error = next.error;
      if (error is Failure) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(error.message)));
      }
    });

    final isSubmitting = ref.watch(openShopControllerProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.openShopTitle)),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              AppTextField(
                controller: _nameController,
                label: l10n.openShopNameLabel,
                prefixIcon: Icons.storefront_outlined,
                validator: (v) => (v == null || v.trim().isEmpty) ? '' : null,
              ),
              const SizedBox(height: 12),
              AppTextField(
                controller: _addressController,
                label: l10n.openShopAddressLabel,
                prefixIcon: Icons.location_on_outlined,
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: _pickOnMap,
                icon: const Icon(Icons.map_outlined),
                label: Text(
                  _pickedLatitude == null ? l10n.openShopPickOnMapButton : l10n.openShopLocationSelected,
                ),
              ),
              const SizedBox(height: 12),
              AppTextField(
                controller: _rayonController,
                label: l10n.openShopRayonLabel,
                prefixIcon: Icons.map_outlined,
              ),
              const SizedBox(height: 12),
              AppTextField(
                controller: _phoneController,
                label: l10n.openShopPhoneLabel,
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone_outlined,
              ),
              const SizedBox(height: 20),
              Text(l10n.openShopCategoriesLabel, style: Theme.of(context).textTheme.titleSmall),
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
                label: l10n.openShopSubmitButton,
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
