import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_entity.freezed.dart';

@freezed
sealed class WorkerEntity with _$WorkerEntity {
  const factory WorkerEntity({
    required String id,
    required String fullName,
    String? avatarUrl,
    String? bio,
    @Default(0) int experienceYears,
    double? priceFrom,
    double? priceTo,
    @Default(<String>[]) List<String> serviceAreas,
    @Default(<String>[]) List<String> portfolioImages,
    String? contactPhone,
    @Default(0) double rating,
    @Default(0) int reviewCount,
    @Default(false) bool isOnline,
    @Default(true) bool isAvailable,
    @Default(false) bool isApproved,
    @Default(<String>[]) List<String> categoryNames,
  }) = _WorkerEntity;
}
