import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_item_entity.freezed.dart';

enum ProjectItemType { work, material, worker }

@freezed
sealed class ProjectItemEntity with _$ProjectItemEntity {
  const factory ProjectItemEntity({
    required String id,
    required String projectId,
    required ProjectItemType itemType,
    required String label,
    @Default(0) double estimatedCost,
    double? actualCost,
  }) = _ProjectItemEntity;
}
