import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/message_entity.dart';

part 'message_model.freezed.dart';

@freezed
sealed class MessageModel with _$MessageModel {
  const MessageModel._();

  const factory MessageModel({
    required String id,
    required String chatId,
    required String senderId,
    required String type,
    String? content,
    String? mediaUrl,
    required bool isRead,
    required String createdAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] as String,
      chatId: json['chat_id'] as String,
      senderId: json['sender_id'] as String,
      type: json['type'] as String? ?? 'text',
      content: json['content'] as String?,
      mediaUrl: json['media_url'] as String?,
      isRead: json['is_read'] as bool? ?? false,
      createdAt: json['created_at'] as String,
    );
  }

  static MessageType _typeFromDb(String value) {
    switch (value) {
      case 'image':
        return MessageType.image;
      case 'audio':
        return MessageType.audio;
      case 'text':
      default:
        return MessageType.text;
    }
  }

  MessageEntity toEntity() {
    return MessageEntity(
      id: id,
      chatId: chatId,
      senderId: senderId,
      type: _typeFromDb(type),
      content: content,
      mediaUrl: mediaUrl,
      isRead: isRead,
      createdAt: DateTime.parse(createdAt),
    );
  }
}
