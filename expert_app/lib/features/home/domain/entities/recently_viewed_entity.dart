import 'package:freezed_annotation/freezed_annotation.dart';

part 'recently_viewed_entity.freezed.dart';

enum RecentlyViewedType { worker, material }

@freezed
sealed class RecentlyViewedEntity with _$RecentlyViewedEntity {
  const factory RecentlyViewedEntity({
    required RecentlyViewedType type,
    required String id,
    required String title,
    String? imageUrl,
    required DateTime viewedAt,
  }) = _RecentlyViewedEntity;
}
