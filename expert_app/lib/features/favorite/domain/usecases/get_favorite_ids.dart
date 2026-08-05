import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/favorite_entity.dart';
import '../repositories/favorite_repository.dart';

class GetFavoriteIds implements UseCase<List<String>, FavoriteTargetType> {
  final FavoriteRepository repository;

  const GetFavoriteIds(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(FavoriteTargetType targetType) {
    return repository.getFavoriteIds(targetType);
  }
}
