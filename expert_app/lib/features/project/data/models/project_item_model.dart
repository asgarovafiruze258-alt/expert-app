import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/project_item_entity.dart';

part 'project_item_model.freezed.dart';

@freezed
sealed class ProjectItemModel with _$ProjectItemModel {
  const ProjectItemModel._();

  const factory ProjectItemModel({
    required String id,
    required String projectId,
    required String itemType,
    required String label,
    required double estimatedCost,
    double? actualCost,
  }) = _ProjectItemModel;

  factory ProjectItemModel.fromJson(Map<String, dynamic> json) {
    return ProjectItemModel(
      id: json['id'] as String,
      projectId: json['project_id'] as String,
      itemType: json['item_type'] as String,
      label: json['label'] as String,
      estimatedCost: (json['estimated_cost'] as num?)?.toDouble() ?? 0,
      actualCost: (json['actual_cost'] as num?)?.toDouble(),
    );
  }

  static ProjectItemType _typeFromDb(String value) {
    switch (value) {
      case 'material':
        return ProjectItemType.material;
      case 'worker':
        return ProjectItemType.worker;
      case 'work':
      default:
        return ProjectItemType.work;
    }
  }

  ProjectItemEntity toEntity() {
    return ProjectItemEntity(
      id: id,
      projectId: projectId,
      itemType: _typeFromDb(itemType),
      label: label,
      estimatedCost: estimatedCost,
      actualCost: actualCost,
    );
  }
}

extension ProjectItemTypeX on ProjectItemType {
  String get dbValue => switch (this) {
        ProjectItemType.work => 'work',
        ProjectItemType.material => 'material',
        ProjectItemType.worker => 'worker',
      };
}
