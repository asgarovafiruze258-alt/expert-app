import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_entity.freezed.dart';

enum ProjectStatus { planning, inProgress, completed }

@freezed
sealed class ProjectEntity with _$ProjectEntity {
  const factory ProjectEntity({
    required String id,
    required String title,
    int? roomCount,
    double? budgetPlanned,
    @Default(0) double estimatedCost,
    required ProjectStatus status,
    required DateTime createdAt,
  }) = _ProjectEntity;
}
