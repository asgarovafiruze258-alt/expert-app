import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/category_entity.dart';

part 'category_model.freezed.dart';

@freezed
sealed class CategoryModel with _$CategoryModel {
  const CategoryModel._();

  const factory CategoryModel({
    required String id,
    required String name,
    String? nameEn,
    String? nameRu,
    String? iconUrl,
    required String type,
    String? parentId,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      nameEn: json['name_en'] as String?,
      nameRu: json['name_ru'] as String?,
      iconUrl: json['icon_url'] as String?,
      type: json['type'] as String,
      parentId: json['parent_id'] as String?,
    );
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      nameEn: nameEn,
      nameRu: nameRu,
      iconUrl: iconUrl,
      type: type == 'material' ? CategoryType.material : CategoryType.worker,
      parentId: parentId,
    );
  }
}
