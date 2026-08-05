import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../material/domain/entities/material_entity.dart';
import '../../../worker/domain/entities/worker_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/recently_viewed_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_datasource.dart';
import '../datasources/recently_viewed_local_datasource.dart';
import '../models/recently_viewed_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final RecentlyViewedLocalDataSource recentlyViewedDataSource;

  const HomeRepositoryImpl(this.remoteDataSource, this.recentlyViewedDataSource);

  Failure _mapException(Object error) {
    if (error is ServerException) return Failure.server(message: error.message);
    if (error is NetworkException) return Failure.network(message: error.message);
    return Failure.unexpected(message: error.toString());
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories({required CategoryType type}) async {
    try {
      final models = await remoteDataSource.getCategories(type: type.name);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, List<WorkerEntity>>> getPopularWorkers({int limit = 10}) async {
    try {
      final models = await remoteDataSource.getPopularWorkers(limit: limit);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, List<MaterialEntity>>> getPopularMaterials({int limit = 10}) async {
    try {
      final models = await remoteDataSource.getPopularMaterials(limit: limit);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, List<MaterialEntity>>> getDiscountedMaterials({int limit = 10}) async {
    try {
      final models = await remoteDataSource.getDiscountedMaterials(limit: limit);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, SearchResults>> search(String query) async {
    try {
      final trimmed = query.trim();
      if (trimmed.isEmpty) {
        return const Right((workers: <WorkerEntity>[], materials: <MaterialEntity>[]));
      }
      final workersFuture = remoteDataSource.searchWorkers(trimmed);
      final materialsFuture = remoteDataSource.searchMaterials(trimmed);
      final workerModels = await workersFuture;
      final materialModels = await materialsFuture;
      return Right((
        workers: workerModels.map((m) => m.toEntity()).toList(),
        materials: materialModels.map((m) => m.toEntity()).toList(),
      ));
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, List<RecentlyViewedEntity>>> getRecentlyViewed() async {
    try {
      final models = await recentlyViewedDataSource.getAll();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> addRecentlyViewed(RecentlyViewedEntity entry) async {
    try {
      await recentlyViewedDataSource.add(RecentlyViewedModel.fromEntity(entry));
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }
}
