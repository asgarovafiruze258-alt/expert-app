import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/recently_viewed_entity.dart';
import '../repositories/home_repository.dart';

class AddRecentlyViewed implements UseCase<Unit, RecentlyViewedEntity> {
  final HomeRepository repository;

  const AddRecentlyViewed(this.repository);

  @override
  Future<Either<Failure, Unit>> call(RecentlyViewedEntity params) {
    return repository.addRecentlyViewed(params);
  }
}
