import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/project_repository.dart';

class DeleteProjectItem implements UseCase<Unit, String> {
  final ProjectRepository repository;

  const DeleteProjectItem(this.repository);

  @override
  Future<Either<Failure, Unit>> call(String id) {
    return repository.deleteProjectItem(id);
  }
}
