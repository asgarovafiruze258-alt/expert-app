import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/project_entity.dart';
import '../repositories/project_repository.dart';

class GetProjectDetail implements UseCase<ProjectEntity, String> {
  final ProjectRepository repository;

  const GetProjectDetail(this.repository);

  @override
  Future<Either<Failure, ProjectEntity>> call(String id) {
    return repository.getProjectDetail(id);
  }
}
