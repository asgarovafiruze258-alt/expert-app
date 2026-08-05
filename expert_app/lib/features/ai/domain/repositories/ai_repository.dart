import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/ai_chat_message_entity.dart';
import '../entities/budget_estimate_entity.dart';

abstract class AiRepository {
  Future<Either<Failure, String>> sendChatMessage({
    required String prompt,
    required List<AiChatMessageEntity> history,
  });

  Future<Either<Failure, BudgetEstimateEntity>> estimateBudget(String description);
}
