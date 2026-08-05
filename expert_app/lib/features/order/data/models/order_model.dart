import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/order_entity.dart';

part 'order_model.freezed.dart';

@freezed
sealed class OrderModel with _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    required String id,
    required String customerId,
    required String targetType,
    required String targetId,
    required String status,
    double? totalPrice,
    String? address,
    String? scheduledDate,
    String? notes,
    required String createdAt,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String,
      customerId: json['customer_id'] as String,
      targetType: json['target_type'] as String,
      targetId: json['target_id'] as String,
      status: json['status'] as String,
      totalPrice: (json['total_price'] as num?)?.toDouble(),
      address: json['address'] as String?,
      scheduledDate: json['scheduled_date'] as String?,
      notes: json['notes'] as String?,
      createdAt: json['created_at'] as String,
    );
  }

  static OrderStatus _statusFromDb(String value) {
    switch (value) {
      case 'accepted':
        return OrderStatus.accepted;
      case 'in_progress':
        return OrderStatus.inProgress;
      case 'completed':
        return OrderStatus.completed;
      case 'cancelled':
        return OrderStatus.cancelled;
      case 'pending':
      default:
        return OrderStatus.pending;
    }
  }

  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      customerId: customerId,
      targetType: targetType == 'material' ? OrderTargetType.material : OrderTargetType.worker,
      targetId: targetId,
      status: _statusFromDb(status),
      totalPrice: totalPrice,
      address: address,
      scheduledDate: scheduledDate != null ? DateTime.parse(scheduledDate!) : null,
      notes: notes,
      createdAt: DateTime.parse(createdAt),
    );
  }
}
