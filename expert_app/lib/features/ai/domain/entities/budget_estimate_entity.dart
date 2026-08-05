import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../project/domain/entities/project_item_entity.dart';

part 'budget_estimate_entity.freezed.dart';

@freezed
sealed class BudgetEstimateItemEntity with _$BudgetEstimateItemEntity {
  const factory BudgetEstimateItemEntity({
    required ProjectItemType itemType,
    required String label,
    required double estimatedCost,
  }) = _BudgetEstimateItemEntity;
}

@freezed
sealed class BudgetEstimateEntity with _$BudgetEstimateEntity {
  const factory BudgetEstimateEntity({
    required double estimatedBudget,
    required List<BudgetEstimateItemEntity> items,
  }) = _BudgetEstimateEntity;
}
