import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/project_entity.dart';
import '../repositories/project_repository.dart';

class UpdateProjectStatusParams {
  final String id;
  final ProjectStatus status;

  const UpdateProjectStatusParams({required this.id, required this.status});
}

class UpdateProjectStatus implements UseCase<Unit, UpdateProjectStatusParams> {
  final ProjectRepository repository;

  const UpdateProjectStatus(this.repository);

  @override
  Future<Either<Failure, Unit>> call(UpdateProjectStatusParams params) {
    return repository.updateProjectStatus(id: params.id, status: params.status);
  }
}
