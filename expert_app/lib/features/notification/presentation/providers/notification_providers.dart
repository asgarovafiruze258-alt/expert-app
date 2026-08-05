import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/datasources/notification_remote_datasource.dart';
import '../../data/repositories/notification_repository_impl.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repositories/notification_repository.dart';
import '../../domain/usecases/mark_all_notifications_as_read.dart';
import '../../domain/usecases/mark_notification_as_read.dart';
import '../../domain/usecases/watch_notifications.dart';

final notificationRemoteDataSourceProvider = Provider<NotificationRemoteDataSource>((ref) {
  return NotificationRemoteDataSourceImpl(ref.watch(supabaseClientProvider));
});

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepositoryImpl(
    ref.watch(notificationRemoteDataSourceProvider),
    ref.watch(supabaseClientProvider),
  );
});

final notificationsStreamProvider = StreamProvider<List<NotificationEntity>>((ref) {
  final usecase = WatchNotifications(ref.watch(notificationRepositoryProvider));
  return usecase(const NoParams()).map((either) => either.fold((failure) => throw failure, (data) => data));
});

final unreadNotificationCountProvider = Provider<int>((ref) {
  final notifications = ref.watch(notificationsStreamProvider).value ?? const [];
  return notifications.where((n) => !n.isRead).length;
});

Future<void> markNotificationAsRead(WidgetRef ref, String id) async {
  await MarkNotificationAsRead(ref.read(notificationRepositoryProvider))(id);
}

Future<void> markAllNotificationsAsRead(WidgetRef ref) async {
  await MarkAllNotificationsAsRead(ref.read(notificationRepositoryProvider))(const NoParams());
}
