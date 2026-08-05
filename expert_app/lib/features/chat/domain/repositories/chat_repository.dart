import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/chat_entity.dart';
import '../entities/message_entity.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<ChatEntity>>> getChats();

  Future<Either<Failure, ChatEntity>> getOrCreateChat({
    required String otherUserId,
    String? orderId,
  });

  Stream<Either<Failure, List<MessageEntity>>> watchMessages(String chatId);

  Future<Either<Failure, Unit>> sendMessage({required String chatId, required String content});

  Future<Either<Failure, Unit>> markAsRead(String chatId);
}
