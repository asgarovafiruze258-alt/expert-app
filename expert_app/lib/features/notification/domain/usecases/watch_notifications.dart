import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/notification_entity.dart';
import '../repositories/notification_repository.dart';

class WatchNotifications implements StreamUseCase<List<NotificationEntity>, NoParams> {
  final NotificationRepository repository;

  const WatchNotifications(this.repository);

  @override
  Stream<Either<Failure, List<NotificationEntity>>> call(NoParams params) {
    return repository.watchNotifications();
  }
}
