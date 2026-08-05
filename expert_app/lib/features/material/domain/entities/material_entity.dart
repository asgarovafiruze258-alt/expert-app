import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_entity.freezed.dart';

@freezed
sealed class MaterialEntity with _$MaterialEntity {
  const factory MaterialEntity({
    required String id,
    required String shopId,
    String? shopName,
    required String categoryId,
    required String name,
    String? description,
    @Default(<String>[]) List<String> images,
    required double price,
    double? discountPrice,
    @Default('ədəd') String unit,
    @Default(0) int stockQty,
    @Default(false) bool isFeatured,
  }) = _MaterialEntity;
}

extension MaterialEntityX on MaterialEntity {
  bool get hasDiscount => discountPrice != null && discountPrice! < price;
}
