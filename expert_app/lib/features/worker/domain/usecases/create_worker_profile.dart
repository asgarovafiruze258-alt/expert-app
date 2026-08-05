import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/worker_entity.dart';
import '../repositories/worker_repository.dart';

class CreateWorkerProfileParams {
  final String bio;
  final int experienceYears;
  final double? priceFrom;
  final double? priceTo;
  final List<String> serviceAreas;
  final String? contactPhone;
  final List<String> categoryIds;

  const CreateWorkerProfileParams({
    required this.bio,
    required this.experienceYears,
    this.priceFrom,
    this.priceTo,
    required this.serviceAreas,
    this.contactPhone,
    required this.categoryIds,
  });
}

class CreateWorkerProfile implements UseCase<WorkerEntity, CreateWorkerProfileParams> {
  final WorkerRepository repository;

  const CreateWorkerProfile(this.repository);

  @override
  Future<Either<Failure, WorkerEntity>> call(CreateWorkerProfileParams params) {
    return repository.createWorkerProfile(
      bio: params.bio,
      experienceYears: params.experienceYears,
      priceFrom: params.priceFrom,
      priceTo: params.priceTo,
      serviceAreas: params.serviceAreas,
      contactPhone: params.contactPhone,
      categoryIds: params.categoryIds,
    );
  }
}
