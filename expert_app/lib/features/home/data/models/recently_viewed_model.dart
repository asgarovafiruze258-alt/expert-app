import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/recently_viewed_entity.dart';

part 'recently_viewed_model.freezed.dart';

@freezed
sealed class RecentlyViewedModel with _$RecentlyViewedModel {
  const RecentlyViewedModel._();

  const factory RecentlyViewedModel({
    required String type,
    required String id,
    required String title,
    String? imageUrl,
    required String viewedAt,
  }) = _RecentlyViewedModel;

  factory RecentlyViewedModel.fromJson(Map<String, dynamic> json) {
    return RecentlyViewedModel(
      type: json['type'] as String,
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String?,
      viewedAt: json['viewedAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'id': id, 'title': title, 'imageUrl': imageUrl, 'viewedAt': viewedAt};
  }

  factory RecentlyViewedModel.fromEntity(RecentlyViewedEntity entity) {
    return RecentlyViewedModel(
      type: entity.type.name,
      id: entity.id,
      title: entity.title,
      imageUrl: entity.imageUrl,
      viewedAt: entity.viewedAt.toIso8601String(),
    );
  }

  RecentlyViewedEntity toEntity() {
    return RecentlyViewedEntity(
      type: type == 'material' ? RecentlyViewedType.material : RecentlyViewedType.worker,
      id: id,
      title: title,
      imageUrl: imageUrl,
      viewedAt: DateTime.parse(viewedAt),
    );
  }
}
