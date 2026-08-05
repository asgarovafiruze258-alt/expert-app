import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';

class MarkAsRead implements UseCase<Unit, String> {
  final ChatRepository repository;

  const MarkAsRead(this.repository);

  @override
  Future<Either<Failure, Unit>> call(String chatId) {
    return repository.markAsRead(chatId);
  }
}
