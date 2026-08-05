import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/message_entity.dart';
import '../repositories/chat_repository.dart';

class WatchMessages implements StreamUseCase<List<MessageEntity>, String> {
  final ChatRepository repository;

  const WatchMessages(this.repository);

  @override
  Stream<Either<Failure, List<MessageEntity>>> call(String chatId) {
    return repository.watchMessages(chatId);
  }
}
