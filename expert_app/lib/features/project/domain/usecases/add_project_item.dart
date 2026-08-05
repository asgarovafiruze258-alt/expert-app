import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/project_item_entity.dart';
import '../repositories/project_repository.dart';

class AddProjectItemParams {
  final String projectId;
  final ProjectItemType itemType;
  final String label;
  final double estimatedCost;
  final double? actualCost;

  const AddProjectItemParams({
    required this.projectId,
    required this.itemType,
    required this.label,
    required this.estimatedCost,
    this.actualCost,
  });
}

class AddProjectItem implements UseCase<ProjectItemEntity, AddProjectItemParams> {
  final ProjectRepository repository;

  const AddProjectItem(this.repository);

  @override
  Future<Either<Failure, ProjectItemEntity>> call(AddProjectItemParams params) {
    return repository.addProjectItem(
      projectId: params.projectId,
      itemType: params.itemType,
      label: params.label,
      estimatedCost: params.estimatedCost,
      actualCost: params.actualCost,
    );
  }
}
