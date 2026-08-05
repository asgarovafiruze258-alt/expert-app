import 'package:supabase_flutter/supabase_flutter.dart';

import 'env.dart';
import 'secure_local_storage.dart';

/// Mərhələ 5-də (Authentication) real Supabase layihəsi yaradıldıqdan sonra
/// main.dart-da çağırılacaq. Env.isSupabaseConfigured false olduqda çağırılmır
/// ki, dəyərlər verilmədən tətbiq çökməsin.
Future<void> initSupabase() async {
  await Supabase.initialize(
    url: Env.supabaseUrl,
    publishableKey: Env.supabaseAnonKey,
    authOptions: FlutterAuthClientOptions(localStorage: SecureLocalStorage()),
  );
}

SupabaseClient get supabase => Supabase.instance.client;
