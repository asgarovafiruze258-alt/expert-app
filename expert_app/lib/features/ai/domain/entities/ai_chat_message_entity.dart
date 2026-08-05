import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_chat_message_entity.freezed.dart';

enum AiMessageRole { user, assistant }

@freezed
sealed class AiChatMessageEntity with _$AiChatMessageEntity {
  const factory AiChatMessageEntity({
    required AiMessageRole role,
    required String content,
  }) = _AiChatMessageEntity;
}
