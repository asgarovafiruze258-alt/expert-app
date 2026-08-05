import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/generated/app_localizations.dart';
import '../localization/locale_provider.dart';

/// AppBar action kimi istifadə olunan dil seçici. Autentifikasiya
/// ekranlarında (istifadəçi hələ daxil olmayıb) dilini dəyişə bilməsi üçün.
class LanguageSwitcher extends ConsumerWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final locale = ref.watch(localeProvider);

    return PopupMenuButton<String>(
      tooltip: l10n.languageLabel,
      initialValue: locale.languageCode,
      onSelected: (code) => ref.read(localeProvider.notifier).setLocale(Locale(code)),
      itemBuilder: (context) => [
        PopupMenuItem(value: 'az', child: Text(l10n.languageAz)),
        PopupMenuItem(value: 'en', child: Text(l10n.languageEn)),
        PopupMenuItem(value: 'ru', child: Text(l10n.languageRu)),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              locale.languageCode.toUpperCase(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(width: 4),
            const Icon(Icons.language),
          ],
        ),
      ),
    );
  }
}
