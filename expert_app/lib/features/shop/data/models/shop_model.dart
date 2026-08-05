import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/shop_entity.dart';

part 'shop_model.freezed.dart';

@freezed
sealed class ShopModel with _$ShopModel {
  const ShopModel._();

  const factory ShopModel({
    required String id,
    required String name,
    String? logoUrl,
    String? address,
    String? rayon,
    required double rating,
    required bool isApproved,
  }) = _ShopModel;

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
      id: json['id'] as String,
      name: json['name'] as String,
      logoUrl: json['logo_url'] as String?,
      address: json['address'] as String?,
      rayon: json['rayon'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      isApproved: json['is_approved'] as bool? ?? false,
    );
  }

  ShopEntity toEntity() {
    return ShopEntity(
      id: id,
      name: name,
      logoUrl: logoUrl,
      address: address,
      rayon: rayon,
      rating: rating,
      isApproved: isApproved,
    );
  }
}
