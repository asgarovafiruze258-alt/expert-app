import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/favorite_entity.dart';
import '../repositories/favorite_repository.dart';

class ToggleFavoriteParams {
  final FavoriteTargetType targetType;
  final String targetId;

  const ToggleFavoriteParams({required this.targetType, required this.targetId});
}

class ToggleFavorite implements UseCase<bool, ToggleFavoriteParams> {
  final FavoriteRepository repository;

  const ToggleFavorite(this.repository);

  @override
  Future<Either<Failure, bool>> call(ToggleFavoriteParams params) {
    return repository.toggleFavorite(targetType: params.targetType, targetId: params.targetId);
  }
}
