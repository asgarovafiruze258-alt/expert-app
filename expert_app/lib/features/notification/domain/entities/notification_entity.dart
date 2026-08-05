import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entity.freezed.dart';

enum NotificationType { newOrder, newMessage, priceDrop, orderConfirmed }

@freezed
sealed class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    required String id,
    required NotificationType type,
    required String title,
    String? body,
    Map<String, dynamic>? payload,
    required bool isRead,
    required DateTime createdAt,
  }) = _NotificationEntity;
}
