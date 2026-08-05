import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/project_entity.dart';
import '../entities/project_item_entity.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectEntity>>> getProjects();

  Future<Either<Failure, ProjectEntity>> getProjectDetail(String id);

  Future<Either<Failure, ProjectEntity>> createProject({
    required String title,
    int? roomCount,
    double? budgetPlanned,
  });

  Future<Either<Failure, Unit>> updateProjectStatus({
    required String id,
    required ProjectStatus status,
  });

  Future<Either<Failure, Unit>> deleteProject(String id);

  Future<Either<Failure, List<ProjectItemEntity>>> getProjectItems(String projectId);

  Future<Either<Failure, ProjectItemEntity>> addProjectItem({
    required String projectId,
    required ProjectItemType itemType,
    required String label,
    required double estimatedCost,
    double? actualCost,
  });

  Future<Either<Failure, Unit>> updateProjectItemActualCost({
    required String id,
    required double actualCost,
  });

  Future<Either<Failure, Unit>> deleteProjectItem(String id);
}
