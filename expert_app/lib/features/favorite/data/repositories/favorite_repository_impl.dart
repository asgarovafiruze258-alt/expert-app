import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/favorite_entity.dart';
import '../../domain/repositories/favorite_repository.dart';
import '../datasources/favorite_remote_datasource.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteRemoteDataSource remoteDataSource;
  final SupabaseClient client;

  const FavoriteRepositoryImpl(this.remoteDataSource, this.client);

  Failure _mapException(Object error) {
    if (error is ServerException) return Failure.server(message: error.message);
    if (error is NetworkException) return Failure.network(message: error.message);
    return Failure.unexpected(message: error.toString());
  }

  @override
  Future<Either<Failure, bool>> toggleFavorite({
    required FavoriteTargetType targetType,
    required String targetId,
  }) async {
    try {
      final userId = client.auth.currentUser?.id;
      if (userId == null) return const Left(Failure.unauthorized());
      final isFavorite = await remoteDataSource.toggleFavorite(
        userId: userId,
        targetType: targetType.name,
        targetId: targetId,
      );
      return Right(isFavorite);
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getFavoriteIds(FavoriteTargetType targetType) async {
    try {
      final userId = client.auth.currentUser?.id;
      if (userId == null) return const Left(Failure.unauthorized());
      final ids = await remoteDataSource.getFavoriteIds(userId: userId, targetType: targetType.name);
      return Right(ids);
    } catch (e) {
      return Left(_mapException(e));
    }
  }
}
