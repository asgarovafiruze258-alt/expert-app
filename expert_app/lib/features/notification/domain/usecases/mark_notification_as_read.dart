import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/notification_repository.dart';

class MarkNotificationAsRead implements UseCase<Unit, String> {
  final NotificationRepository repository;

  const MarkNotificationAsRead(this.repository);

  @override
  Future<Either<Failure, Unit>> call(String id) {
    return repository.markAsRead(id);
  }
}
