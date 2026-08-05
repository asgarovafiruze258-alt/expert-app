import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/project_entity.dart';
import '../repositories/project_repository.dart';

class CreateProjectParams {
  final String title;
  final int? roomCount;
  final double? budgetPlanned;

  const CreateProjectParams({required this.title, this.roomCount, this.budgetPlanned});
}

class CreateProject implements UseCase<ProjectEntity, CreateProjectParams> {
  final ProjectRepository repository;

  const CreateProject(this.repository);

  @override
  Future<Either<Failure, ProjectEntity>> call(CreateProjectParams params) {
    return repository.createProject(
      title: params.title,
      roomCount: params.roomCount,
      budgetPlanned: params.budgetPlanned,
    );
  }
}
