import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';

abstract class FavoriteRemoteDataSource {
  Future<bool> toggleFavorite({
    required String userId,
    required String targetType,
    required String targetId,
  });

  Future<List<String>> getFavoriteIds({required String userId, required String targetType});
}

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  final SupabaseClient client;

  const FavoriteRemoteDataSourceImpl(this.client);

  @override
  Future<bool> toggleFavorite({
    required String userId,
    required String targetType,
    required String targetId,
  }) async {
    try {
      final existing = await client
          .from('favorites')
          .select('id')
          .eq('user_id', userId)
          .eq('target_type', targetType)
          .eq('target_id', targetId)
          .maybeSingle();

      if (existing != null) {
        await client.from('favorites').delete().eq('id', existing['id'] as String);
        return false;
      }

      await client.from('favorites').insert({
        'user_id': userId,
        'target_type': targetType,
        'target_id': targetId,
      });
      return true;
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<String>> getFavoriteIds({required String userId, required String targetType}) async {
    try {
      final rows = await client
          .from('favorites')
          .select('target_id')
          .eq('user_id', userId)
          .eq('target_type', targetType);
      return (rows as List).map((row) => (row as Map<String, dynamic>)['target_id'] as String).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }
}
