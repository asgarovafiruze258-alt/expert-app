import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/review_entity.dart';

part 'review_model.freezed.dart';

@freezed
sealed class ReviewModel with _$ReviewModel {
  const ReviewModel._();

  const factory ReviewModel({
    required String id,
    required String reviewerId,
    required String reviewerName,
    String? reviewerAvatar,
    required String targetType,
    required String targetId,
    String? orderId,
    required int rating,
    String? comment,
    required List<String> images,
    required String createdAt,
  }) = _ReviewModel;

  /// `reviews?select=*,profiles(full_name,avatar_url)` sorğusunun nəticəsini gözləyir.
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    final reviewer = json['profiles'] as Map<String, dynamic>? ?? const {};
    return ReviewModel(
      id: json['id'] as String,
      reviewerId: json['reviewer_id'] as String,
      reviewerName: (reviewer['full_name'] as String?) ?? '',
      reviewerAvatar: reviewer['avatar_url'] as String?,
      targetType: json['target_type'] as String,
      targetId: json['target_id'] as String,
      orderId: json['order_id'] as String?,
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String?,
      images: List<String>.from(json['images'] as List? ?? const []),
      createdAt: json['created_at'] as String,
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      id: id,
      reviewerId: reviewerId,
      reviewerName: reviewerName,
      reviewerAvatar: reviewerAvatar,
      targetType: targetType == 'shop' ? ReviewTargetType.shop : ReviewTargetType.worker,
      targetId: targetId,
      orderId: orderId,
      rating: rating,
      comment: comment,
      images: images,
      createdAt: DateTime.parse(createdAt),
    );
  }
}
