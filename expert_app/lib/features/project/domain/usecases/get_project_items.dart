import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/project_item_entity.dart';
import '../repositories/project_repository.dart';

class GetProjectItems implements UseCase<List<ProjectItemEntity>, String> {
  final ProjectRepository repository;

  const GetProjectItems(this.repository);

  @override
  Future<Either<Failure, List<ProjectItemEntity>>> call(String projectId) {
    return repository.getProjectItems(projectId);
  }
}
