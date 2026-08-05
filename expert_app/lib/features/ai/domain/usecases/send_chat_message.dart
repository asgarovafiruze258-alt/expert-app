import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/ai_chat_message_entity.dart';
import '../repositories/ai_repository.dart';

class SendChatMessageParams {
  final String prompt;
  final List<AiChatMessageEntity> history;

  const SendChatMessageParams({required this.prompt, required this.history});
}

class SendChatMessage implements UseCase<String, SendChatMessageParams> {
  final AiRepository repository;

  const SendChatMessage(this.repository);

  @override
  Future<Either<Failure, String>> call(SendChatMessageParams params) {
    return repository.sendChatMessage(prompt: params.prompt, history: params.history);
  }
}
