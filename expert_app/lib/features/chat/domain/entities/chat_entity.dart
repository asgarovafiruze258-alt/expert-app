import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_entity.freezed.dart';

@freezed
sealed class ChatEntity with _$ChatEntity {
  const factory ChatEntity({
    required String id,
    required String otherUserId,
    required String otherUserName,
    String? otherUserAvatarUrl,
    String? orderId,
    String? lastMessageText,
    DateTime? lastMessageAt,
    required DateTime createdAt,
  }) = _ChatEntity;
}
