import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/chat_entity.dart';
import '../repositories/chat_repository.dart';

class GetOrCreateChatParams {
  final String otherUserId;
  final String? orderId;

  const GetOrCreateChatParams({required this.otherUserId, this.orderId});
}

class GetOrCreateChat implements UseCase<ChatEntity, GetOrCreateChatParams> {
  final ChatRepository repository;

  const GetOrCreateChat(this.repository);

  @override
  Future<Either<Failure, ChatEntity>> call(GetOrCreateChatParams params) {
    return repository.getOrCreateChat(otherUserId: params.otherUserId, orderId: params.orderId);
  }
}
