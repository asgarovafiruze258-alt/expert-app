import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/project_entity.dart';

part 'project_model.freezed.dart';

@freezed
sealed class ProjectModel with _$ProjectModel {
  const ProjectModel._();

  const factory ProjectModel({
    required String id,
    required String title,
    int? roomCount,
    double? budgetPlanned,
    required double estimatedCost,
    required String status,
    required String createdAt,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] as String,
      title: json['title'] as String,
      roomCount: (json['room_count'] as num?)?.toInt(),
      budgetPlanned: (json['budget_planned'] as num?)?.toDouble(),
      estimatedCost: (json['estimated_cost'] as num?)?.toDouble() ?? 0,
      status: json['status'] as String? ?? 'planning',
      createdAt: json['created_at'] as String,
    );
  }

  static ProjectStatus _statusFromDb(String value) {
    switch (value) {
      case 'in_progress':
        return ProjectStatus.inProgress;
      case 'completed':
        return ProjectStatus.completed;
      case 'planning':
      default:
        return ProjectStatus.planning;
    }
  }

  ProjectEntity toEntity() {
    return ProjectEntity(
      id: id,
      title: title,
      roomCount: roomCount,
      budgetPlanned: budgetPlanned,
      estimatedCost: estimatedCost,
      status: _statusFromDb(status),
      createdAt: DateTime.parse(createdAt),
    );
  }
}

extension ProjectStatusX on ProjectStatus {
  String get dbValue => switch (this) {
        ProjectStatus.planning => 'planning',
        ProjectStatus.inProgress => 'in_progress',
        ProjectStatus.completed => 'completed',
      };
}
