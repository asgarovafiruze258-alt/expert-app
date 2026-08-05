import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repositories/notification_repository.dart';
import '../datasources/notification_remote_datasource.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;
  final SupabaseClient client;

  const NotificationRepositoryImpl(this.remoteDataSource, this.client);

  Failure _mapException(Object error) {
    if (error is ServerException) return Failure.server(message: error.message);
    if (error is NetworkException) return Failure.network(message: error.message);
    return Failure.unexpected(message: error.toString());
  }

  String? get _userId => client.auth.currentUser?.id;

  @override
  Stream<Either<Failure, List<NotificationEntity>>> watchNotifications() async* {
    try {
      final userId = _userId;
      if (userId == null) {
        yield const Left(Failure.unauthorized());
        return;
      }
      await for (final models in remoteDataSource.watchNotifications(userId)) {
        yield Right(models.map((m) => m.toEntity()).toList());
      }
    } catch (e) {
      yield Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> markAsRead(String id) async {
    try {
      await remoteDataSource.markAsRead(id);
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> markAllAsRead() async {
    try {
      final userId = _userId;
      if (userId == null) return const Left(Failure.unauthorized());
      await remoteDataSource.markAllAsRead(userId);
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }
}
