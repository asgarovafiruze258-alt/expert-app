import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/chat_model.dart';
import '../models/message_model.dart';

const _chatSelect = '*, '
    'one:profiles!chats_participant_one_fkey(full_name,avatar_url), '
    'two:profiles!chats_participant_two_fkey(full_name,avatar_url)';

abstract class ChatRemoteDataSource {
  Future<List<ChatModel>> getChats(String userId);
  Future<ChatModel?> findChat({required String userId, required String otherUserId});
  Future<ChatModel> createChat({required String userId, required String otherUserId, String? orderId});

  Stream<List<MessageModel>> watchMessages(String chatId);
  Future<MessageModel> sendMessage({
    required String chatId,
    required String senderId,
    required String content,
  });
  Future<void> markAsRead({required String chatId, required String userId});
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final SupabaseClient client;

  const ChatRemoteDataSourceImpl(this.client);

  @override
  Future<List<ChatModel>> getChats(String userId) async {
    try {
      final rows = await client
          .from('chats')
          .select(_chatSelect)
          .or('participant_one.eq.$userId,participant_two.eq.$userId')
          .order('last_message_at', ascending: false);
      return (rows as List)
          .map((row) => ChatModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<ChatModel?> findChat({required String userId, required String otherUserId}) async {
    try {
      final rows = await client
          .from('chats')
          .select(_chatSelect)
          .or(
            'and(participant_one.eq.$userId,participant_two.eq.$otherUserId),'
            'and(participant_one.eq.$otherUserId,participant_two.eq.$userId)',
          )
          .limit(1);
      final list = rows as List;
      if (list.isEmpty) return null;
      return ChatModel.fromJson(list.first as Map<String, dynamic>);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<ChatModel> createChat({
    required String userId,
    required String otherUserId,
    String? orderId,
  }) async {
    try {
      final row = await client
          .from('chats')
          .insert({
            'participant_one': userId,
            'participant_two': otherUserId,
            'order_id': orderId,
          })
          .select(_chatSelect)
          .single();
      return ChatModel.fromJson(row);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Stream<List<MessageModel>> watchMessages(String chatId) {
    return client
        .from('messages')
        .stream(primaryKey: ['id'])
        .eq('chat_id', chatId)
        .order('created_at')
        .map((rows) => rows.map(MessageModel.fromJson).toList());
  }

  @override
  Future<MessageModel> sendMessage({
    required String chatId,
    required String senderId,
    required String content,
  }) async {
    try {
      final row = await client
          .from('messages')
          .insert({
            'chat_id': chatId,
            'sender_id': senderId,
            'type': 'text',
            'content': content,
          })
          .select()
          .single();
      return MessageModel.fromJson(row);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> markAsRead({required String chatId, required String userId}) async {
    try {
      await client
          .from('messages')
          .update({'is_read': true})
          .eq('chat_id', chatId)
          .neq('sender_id', userId)
          .eq('is_read', false);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }
}
