import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_entity.freezed.dart';

enum ReviewTargetType { worker, shop }

@freezed
sealed class ReviewEntity with _$ReviewEntity {
  const factory ReviewEntity({
    required String id,
    required String reviewerId,
    required String reviewerName,
    String? reviewerAvatar,
    required ReviewTargetType targetType,
    required String targetId,
    String? orderId,
    required int rating,
    String? comment,
    @Default(<String>[]) List<String> images,
    required DateTime createdAt,
  }) = _ReviewEntity;
}
