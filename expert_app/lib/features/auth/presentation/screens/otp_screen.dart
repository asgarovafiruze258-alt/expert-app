import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/language_switcher.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../providers/phone_auth_controller.dart';

class OtpScreen extends ConsumerStatefulWidget {
  final String phone;

  const OtpScreen({super.key, required this.phone});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    await ref.read(phoneAuthControllerProvider.notifier).verifyOtp(
          phone: widget.phone,
          otp: _otpController.text.trim(),
        );
  }

  Future<void> _resend() async {
    await ref.read(phoneAuthControllerProvider.notifier).sendOtp(widget.phone);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    ref.listen(phoneAuthControllerProvider, (previous, next) {
      final error = next.error;
      if (error is Failure) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(error.message)));
      }
    });

    final isLoading = ref.watch(phoneAuthControllerProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.authOtpTitle),
        actions: const [LanguageSwitcher()],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(l10n.authOtpSubtitle(widget.phone)),
                const SizedBox(height: 24),
                AppTextField(
                  controller: _otpController,
                  label: l10n.authOtpLabel,
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.sms_outlined,
                  validator: Validators.otp,
                ),
                const SizedBox(height: 24),
                AppButton(
                  label: l10n.authVerifyButton,
                  isLoading: isLoading,
                  onPressed: _submit,
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: isLoading ? null : _resend,
                  child: Text(l10n.authResendOtp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
