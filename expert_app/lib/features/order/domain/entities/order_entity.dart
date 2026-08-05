import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_entity.freezed.dart';

enum OrderTargetType { worker, material }

enum OrderStatus { pending, accepted, inProgress, completed, cancelled }

@freezed
sealed class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    required String id,
    required String customerId,
    required OrderTargetType targetType,
    required String targetId,
    required OrderStatus status,
    double? totalPrice,
    String? address,
    DateTime? scheduledDate,
    String? notes,
    required DateTime createdAt,
  }) = _OrderEntity;
}
