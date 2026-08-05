import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/worker_entity.dart';
import '../../domain/repositories/worker_repository.dart';
import '../datasources/worker_remote_datasource.dart';

class WorkerRepositoryImpl implements WorkerRepository {
  final WorkerRemoteDataSource remoteDataSource;

  const WorkerRepositoryImpl(this.remoteDataSource);

  Failure _mapException(Object error) {
    if (error is ServerException) return Failure.server(message: error.message);
    if (error is NetworkException) return Failure.network(message: error.message);
    if (error is UnauthorizedException) return Failure.unauthorized(message: error.message);
    return Failure.unexpected(message: error.toString());
  }

  @override
  Future<Either<Failure, List<WorkerEntity>>> getWorkers({String? categoryId}) async {
    try {
      final models = await remoteDataSource.getWorkers(categoryId: categoryId);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, WorkerEntity>> getWorkerDetail(String id) async {
    try {
      final model = await remoteDataSource.getWorkerDetail(id);
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, WorkerEntity?>> getMyWorkerProfile() async {
    try {
      final model = await remoteDataSource.getMyWorkerProfile();
      return Right(model?.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, WorkerEntity>> createWorkerProfile({
    required String bio,
    required int experienceYears,
    double? priceFrom,
    double? priceTo,
    required List<String> serviceAreas,
    String? contactPhone,
    required List<String> categoryIds,
  }) async {
    try {
      final model = await remoteDataSource.createWorkerProfile(
        bio: bio,
        experienceYears: experienceYears,
        priceFrom: priceFrom,
        priceTo: priceTo,
        serviceAreas: serviceAreas,
        contactPhone: contactPhone,
        categoryIds: categoryIds,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }
}
