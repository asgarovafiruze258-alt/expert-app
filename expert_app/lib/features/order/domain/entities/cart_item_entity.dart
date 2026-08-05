import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../material/domain/entities/material_entity.dart';

part 'cart_item_entity.freezed.dart';

@freezed
sealed class CartItemEntity with _$CartItemEntity {
  const CartItemEntity._();

  const factory CartItemEntity({
    required MaterialEntity material,
    required int quantity,
  }) = _CartItemEntity;

  double get unitPrice => material.hasDiscount ? material.discountPrice! : material.price;

  double get lineTotal => unitPrice * quantity;
}
