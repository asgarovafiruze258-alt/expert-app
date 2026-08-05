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
}
