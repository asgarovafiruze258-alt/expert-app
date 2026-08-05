import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_entity.freezed.dart';

@freezed
sealed class ShopEntity with _$ShopEntity {
  const factory ShopEntity({
    required String id,
    required String name,
    String? logoUrl,
    String? address,
    String? rayon,
    @Default(0) double rating,
    @Default(false) bool isApproved,
  }) = _ShopEntity;
}
