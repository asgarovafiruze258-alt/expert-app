import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/review_model.dart';

abstract class ReviewRemoteDataSource {
  Future<List<ReviewModel>> getReviewsForTarget({required String targetType, required String targetId});
}

class ReviewRemoteDataSourceImpl implements ReviewRemoteDataSource {
  final SupabaseClient client;

  const ReviewRemoteDataSourceImpl(this.client);

  @override
  Future<List<ReviewModel>> getReviewsForTarget({
    required String targetType,
    required String targetId,
  }) async {
    try {
      final rows = await client
          .from('reviews')
          .select('*, profiles(full_name, avatar_url)')
          .eq('target_type', targetType)
          .eq('target_id', targetId)
          .order('created_at', ascending: false);
      return (rows as List)
          .map((row) => ReviewModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }
}
