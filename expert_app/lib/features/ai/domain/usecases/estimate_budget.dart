import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/budget_estimate_entity.dart';
import '../repositories/ai_repository.dart';

class EstimateBudget implements UseCase<BudgetEstimateEntity, String> {
  final AiRepository repository;

  const EstimateBudget(this.repository);

  @override
  Future<Either<Failure, BudgetEstimateEntity>> call(String description) {
    return repository.estimateBudget(description);
  }
}
