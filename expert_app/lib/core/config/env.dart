/// Runtime konfiqurasiya dəyərləri. Real dəyərlər `--dart-define` və ya
/// `--dart-define-from-file` ilə build zamanı ötürülməlidir, koda yazılmamalıdır.
///
/// Nümunə:
/// flutter run --dart-define=SUPABASE_URL=https://xxx.supabase.co --dart-define=SUPABASE_ANON_KEY=xxx
class Env {
  const Env._();

  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  static bool get isSupabaseConfigured =>
      supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty;
}
