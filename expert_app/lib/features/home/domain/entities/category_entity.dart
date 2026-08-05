import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

enum CategoryType { worker, material }

@freezed
sealed class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required String id,
    required String name,
    String? nameEn,
    String? nameRu,
    String? iconUrl,
    required CategoryType type,
    String? parentId,
  }) = _CategoryEntity;
}
