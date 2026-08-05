import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase sessiyasını (access/refresh token) `SharedPreferences`-in
/// açıq mətn saxladığı defolt üsul əvəzinə cihazın təhlükəsiz açar
/// zənciri ilə (Android Keystore / iOS Keychain) şifrələnmiş saxlayır —
/// cihaz oğurlanarsa/kompromis olarsa token-in oxunmasının qarşısını alır.
class SecureLocalStorage extends LocalStorage {
  SecureLocalStorage() : _storage = const FlutterSecureStorage();

  static const _key = 'supabase.auth.session';

  final FlutterSecureStorage _storage;

  @override
  Future<void> initialize() async {}

  @override
  Future<bool> hasAccessToken() async {
    return (await _storage.read(key: _key)) != null;
  }

  @override
  Future<String?> accessToken() {
    return _storage.read(key: _key);
  }

  @override
  Future<void> removePersistedSession() {
    return _storage.delete(key: _key);
  }

  @override
  Future<void> persistSession(String persistSessionString) {
    return _storage.write(key: _key, value: persistSessionString);
  }
}
