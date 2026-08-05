import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';

class SendMessageParams {
  final String chatId;
  final String content;

  const SendMessageParams({required this.chatId, required this.content});
}

class SendMessage implements UseCase<Unit, SendMessageParams> {
  final ChatRepository repository;

  const SendMessage(this.repository);

  @override
  Future<Either<Failure, Unit>> call(SendMessageParams params) {
    return repository.sendMessage(chatId: params.chatId, content: params.content);
  }
}
