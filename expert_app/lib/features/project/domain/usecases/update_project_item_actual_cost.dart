import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/project_repository.dart';

class UpdateProjectItemActualCostParams {
  final String id;
  final double actualCost;

  const UpdateProjectItemActualCostParams({required this.id, required this.actualCost});
}

class UpdateProjectItemActualCost implements UseCase<Unit, UpdateProjectItemActualCostParams> {
  final ProjectRepository repository;

  const UpdateProjectItemActualCost(this.repository);

  @override
  Future<Either<Failure, Unit>> call(UpdateProjectItemActualCostParams params) {
    return repository.updateProjectItemActualCost(id: params.id, actualCost: params.actualCost);
  }
}
