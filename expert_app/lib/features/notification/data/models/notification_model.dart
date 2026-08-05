import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/notification_entity.dart';

part 'notification_model.freezed.dart';

@freezed
sealed class NotificationModel with _$NotificationModel {
  const NotificationModel._();

  const factory NotificationModel({
    required String id,
    required String type,
    required String title,
    String? body,
    Map<String, dynamic>? payload,
    required bool isRead,
    required String createdAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      body: json['body'] as String?,
      payload: json['payload'] as Map<String, dynamic>?,
      isRead: json['is_read'] as bool? ?? false,
      createdAt: json['created_at'] as String,
    );
  }

  static NotificationType _typeFromDb(String value) {
    switch (value) {
      case 'new_message':
        return NotificationType.newMessage;
      case 'price_drop':
        return NotificationType.priceDrop;
      case 'order_confirmed':
        return NotificationType.orderConfirmed;
      case 'new_order':
      default:
        return NotificationType.newOrder;
    }
  }

  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id,
      type: _typeFromDb(type),
      title: title,
      body: body,
      payload: payload,
      isRead: isRead,
      createdAt: DateTime.parse(createdAt),
    );
  }
}
