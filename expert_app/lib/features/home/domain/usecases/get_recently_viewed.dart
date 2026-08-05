import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/recently_viewed_entity.dart';
import '../repositories/home_repository.dart';

class GetRecentlyViewed implements UseCase<List<RecentlyViewedEntity>, NoParams> {
  final HomeRepository repository;

  const GetRecentlyViewed(this.repository);

  @override
  Future<Either<Failure, List<RecentlyViewedEntity>>> call(NoParams params) {
    return repository.getRecentlyViewed();
  }
}
