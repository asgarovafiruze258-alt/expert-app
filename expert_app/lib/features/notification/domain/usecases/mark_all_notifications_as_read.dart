import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/notification_repository.dart';

class MarkAllNotificationsAsRead implements UseCase<Unit, NoParams> {
  final NotificationRepository repository;

  const MarkAllNotificationsAsRead(this.repository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) {
    return repository.markAllAsRead();
  }
}
