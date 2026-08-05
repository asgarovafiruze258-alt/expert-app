import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/datasources/review_remote_datasource.dart';
import '../../data/repositories/review_repository_impl.dart';
import '../../domain/entities/review_entity.dart';
import '../../domain/repositories/review_repository.dart';
import '../../domain/usecases/get_reviews_for_target.dart';

final reviewRemoteDataSourceProvider = Provider<ReviewRemoteDataSource>((ref) {
  return ReviewRemoteDataSourceImpl(ref.watch(supabaseClientProvider));
});

final reviewRepositoryProvider = Provider<ReviewRepository>((ref) {
  return ReviewRepositoryImpl(ref.watch(reviewRemoteDataSourceProvider));
});

final workerReviewsProvider = FutureProvider.family<List<ReviewEntity>, String>((ref, workerId) async {
  final result = await GetReviewsForTarget(ref.watch(reviewRepositoryProvider))(
    GetReviewsForTargetParams(targetType: ReviewTargetType.worker, targetId: workerId),
  );
  return result.fold((failure) => throw failure, (data) => data);
});
