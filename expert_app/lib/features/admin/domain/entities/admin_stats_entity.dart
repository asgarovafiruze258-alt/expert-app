import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_stats_entity.freezed.dart';

@freezed
sealed class AdminStatsEntity with _$AdminStatsEntity {
  const factory AdminStatsEntity({
    required int userCount,
    required int workerCount,
    required int pendingWorkerCount,
    required int shopCount,
    required int pendingShopCount,
    required int materialCount,
    required int orderCount,
  }) = _AdminStatsEntity;
}
