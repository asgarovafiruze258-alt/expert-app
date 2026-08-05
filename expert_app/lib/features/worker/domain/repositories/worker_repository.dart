import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/worker_entity.dart';

abstract class WorkerRepository {
  Future<Either<Failure, List<WorkerEntity>>> getWorkers({String? categoryId});

  Future<Either<Failure, WorkerEntity>> getWorkerDetail(String id);

  /// Cari istifadəçinin usta profili varsa qaytarır, yoxdursa `null`.
  Future<Either<Failure, WorkerEntity?>> getMyWorkerProfile();

  Future<Either<Failure, WorkerEntity>> createWorkerProfile({
    required String bio,
    required int experienceYears,
    double? priceFrom,
    double? priceTo,
    required List<String> serviceAreas,
    String? contactPhone,
    required List<String> categoryIds,
  });
}
