import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../material/domain/entities/material_entity.dart';
import '../../../worker/domain/entities/worker_entity.dart';
import '../entities/category_entity.dart';
import '../entities/recently_viewed_entity.dart';

typedef SearchResults = ({List<WorkerEntity> workers, List<MaterialEntity> materials});

abstract class HomeRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories({required CategoryType type});

  Future<Either<Failure, List<WorkerEntity>>> getPopularWorkers({int limit = 10});

  Future<Either<Failure, List<MaterialEntity>>> getPopularMaterials({int limit = 10});

  Future<Either<Failure, List<MaterialEntity>>> getDiscountedMaterials({int limit = 10});

  Future<Either<Failure, SearchResults>> search(String query);

  Future<Either<Failure, List<RecentlyViewedEntity>>> getRecentlyViewed();

  Future<Either<Failure, Unit>> addRecentlyViewed(RecentlyViewedEntity entry);
}
