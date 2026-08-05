import 'package:flutter/material.dart';

/// Env.isSupabaseConfigured false olduqda göstərilir — real Supabase layihəsi
/// yaradılıb --dart-define ilə ötürülənə qədər auth/data axını işə düşmür.
class SupabaseNotConfiguredScreen extends StatelessWidget {
  const SupabaseNotConfiguredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.cloud_off_outlined, size: 56),
                const SizedBox(height: 16),
                Text(
                  'Supabase konfiqurasiya olunmayıb',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Tətbiqi işə salmaq üçün Supabase layihənizin URL və '
                  'publishable/anon açarını --dart-define ilə ötürün:\n\n'
                  'flutter run \\\n'
                  '  --dart-define=SUPABASE_URL=https://xxx.supabase.co \\\n'
                  '  --dart-define=SUPABASE_ANON_KEY=xxx',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
