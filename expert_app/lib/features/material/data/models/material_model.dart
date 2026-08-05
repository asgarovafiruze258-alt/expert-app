import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/material_entity.dart';

part 'material_model.freezed.dart';

@freezed
sealed class MaterialModel with _$MaterialModel {
  const MaterialModel._();

  const factory MaterialModel({
    required String id,
    required String shopId,
    String? shopName,
    required String categoryId,
    required String name,
    String? description,
    required List<String> images,
    required double price,
    double? discountPrice,
    required String unit,
    required int stockQty,
    required bool isFeatured,
  }) = _MaterialModel;

  /// `materials?select=*,shops(name)` sorğusunun nəticəsini gözləyir.
  factory MaterialModel.fromJson(Map<String, dynamic> json) {
    final shop = json['shops'] as Map<String, dynamic>?;
    return MaterialModel(
      id: json['id'] as String,
      shopId: json['shop_id'] as String,
      shopName: shop?['name'] as String?,
      categoryId: json['category_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      images: List<String>.from(json['images'] as List? ?? const []),
      price: (json['price'] as num).toDouble(),
      discountPrice: (json['discount_price'] as num?)?.toDouble(),
      unit: json['unit'] as String? ?? 'ədəd',
      stockQty: (json['stock_qty'] as num?)?.toInt() ?? 0,
      isFeatured: json['is_featured'] as bool? ?? false,
    );
  }

  MaterialEntity toEntity() {
    return MaterialEntity(
      id: id,
      shopId: shopId,
      shopName: shopName,
      categoryId: categoryId,
      name: name,
      description: description,
      images: images,
      price: price,
      discountPrice: discountPrice,
      unit: unit,
      stockQty: stockQty,
      isFeatured: isFeatured,
    );
  }
}
