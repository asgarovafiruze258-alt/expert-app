import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../repositories/admin_repository.dart';

class UpdateUserRoleParams {
  final String userId;
  final UserRole role;

  const UpdateUserRoleParams({required this.userId, required this.role});
}

class UpdateUserRole implements UseCase<Unit, UpdateUserRoleParams> {
  final AdminRepository repository;

  const UpdateUserRole(this.repository);

  @override
  Future<Either<Failure, Unit>> call(UpdateUserRoleParams params) {
    return repository.updateUserRole(userId: params.userId, role: params.role);
  }
}
