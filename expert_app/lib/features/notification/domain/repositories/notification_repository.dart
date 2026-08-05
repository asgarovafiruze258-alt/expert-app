import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/notification_entity.dart';

abstract class NotificationRepository {
  Stream<Either<Failure, List<NotificationEntity>>> watchNotifications();

  Future<Either<Failure, Unit>> markAsRead(String id);

  Future<Either<Failure, Unit>> markAllAsRead();
}
