import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_entity.freezed.dart';

enum MessageType { text, image, audio }

@freezed
sealed class MessageEntity with _$MessageEntity {
  const factory MessageEntity({
    required String id,
    required String chatId,
    required String senderId,
    required MessageType type,
    String? content,
    String? mediaUrl,
    required bool isRead,
    required DateTime createdAt,
  }) = _MessageEntity;
}
