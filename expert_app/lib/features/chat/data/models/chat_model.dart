import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/chat_entity.dart';

part 'chat_model.freezed.dart';

@freezed
sealed class ChatModel with _$ChatModel {
  const ChatModel._();

  const factory ChatModel({
    required String id,
    required String participantOne,
    required String participantTwo,
    String? participantOneName,
    String? participantOneAvatar,
    String? participantTwoName,
    String? participantTwoAvatar,
    String? orderId,
    String? lastMessageText,
    String? lastMessageAt,
    required String createdAt,
  }) = _ChatModel;

  /// `chats?select=*,one:profiles!chats_participant_one_fkey(...),two:profiles!chats_participant_two_fkey(...)`
  /// sorğusunun nəticəsini gözləyir.
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    final one = json['one'] as Map<String, dynamic>?;
    final two = json['two'] as Map<String, dynamic>?;
    return ChatModel(
      id: json['id'] as String,
      participantOne: json['participant_one'] as String,
      participantTwo: json['participant_two'] as String,
      participantOneName: one?['full_name'] as String?,
      participantOneAvatar: one?['avatar_url'] as String?,
      participantTwoName: two?['full_name'] as String?,
      participantTwoAvatar: two?['avatar_url'] as String?,
      orderId: json['order_id'] as String?,
      lastMessageText: json['last_message_text'] as String?,
      lastMessageAt: json['last_message_at'] as String?,
      createdAt: json['created_at'] as String,
    );
  }

  ChatEntity toEntity(String currentUserId) {
    final isOne = participantOne == currentUserId;
    return ChatEntity(
      id: id,
      otherUserId: isOne ? participantTwo : participantOne,
      otherUserName: (isOne ? participantTwoName : participantOneName) ?? '',
      otherUserAvatarUrl: isOne ? participantTwoAvatar : participantOneAvatar,
      orderId: orderId,
      lastMessageText: lastMessageText,
      lastMessageAt: lastMessageAt != null ? DateTime.parse(lastMessageAt!) : null,
      createdAt: DateTime.parse(createdAt),
    );
  }
}
