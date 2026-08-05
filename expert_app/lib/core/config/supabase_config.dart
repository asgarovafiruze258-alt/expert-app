import 'package:supabase_flutter/supabase_flutter.dart';

import 'env.dart';

/// Mərhələ 5-də (Authentication) real Supabase layihəsi yaradıldıqdan sonra
/// main.dart-da çağırılacaq. Env.isSupabaseConfigured false olduqda çağırılmır
/// ki, dəyərlər verilmədən tətbiq çökməsin.
Future<void> initSupabase() async {
  await Supabase.initialize(
    url: Env.supabaseUrl,
    publishableKey: Env.supabaseAnonKey,
  );
}

SupabaseClient get supabase => Supabase.instance.client;
