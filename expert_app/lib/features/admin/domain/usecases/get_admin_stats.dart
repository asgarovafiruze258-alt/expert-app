import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/admin_stats_entity.dart';
import '../repositories/admin_repository.dart';

class GetAdminStats implements UseCase<AdminStatsEntity, NoParams> {
  final AdminRepository repository;

  const GetAdminStats(this.repository);

  @override
  Future<Either<Failure, AdminStatsEntity>> call(NoParams params) {
    return repository.getStats();
  }
}
