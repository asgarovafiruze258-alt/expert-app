import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/favorite_entity.dart';

abstract class FavoriteRepository {
  /// Toggle edir və yeni vəziyyəti (seçilmiş olub-olmadığını) qaytarır.
  Future<Either<Failure, bool>> toggleFavorite({
    required FavoriteTargetType targetType,
    required String targetId,
  });

  Future<Either<Failure, List<String>>> getFavoriteIds(FavoriteTargetType targetType);
}
