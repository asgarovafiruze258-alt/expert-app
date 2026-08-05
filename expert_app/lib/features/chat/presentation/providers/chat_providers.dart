import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/datasources/chat_remote_datasource.dart';
import '../../data/repositories/chat_repository_impl.dart';
import '../../domain/entities/chat_entity.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/repositories/chat_repository.dart';
import '../../domain/usecases/get_chats.dart';
import '../../domain/usecases/get_or_create_chat.dart';
import '../../domain/usecases/mark_as_read.dart';
import '../../domain/usecases/send_message.dart';
import '../../domain/usecases/watch_messages.dart';

final chatRemoteDataSourceProvider = Provider<ChatRemoteDataSource>((ref) {
  return ChatRemoteDataSourceImpl(ref.watch(supabaseClientProvider));
});

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  return ChatRepositoryImpl(ref.watch(chatRemoteDataSourceProvider), ref.watch(supabaseClientProvider));
});

final chatsListProvider = FutureProvider<List<ChatEntity>>((ref) async {
  final result = await GetChats(ref.watch(chatRepositoryProvider))(const NoParams());
  return result.fold((failure) => throw failure, (data) => data);
});

final messagesStreamProvider = StreamProvider.family<List<MessageEntity>, String>((ref, chatId) {
  final usecase = WatchMessages(ref.watch(chatRepositoryProvider));
  return usecase(chatId).map((either) => either.fold((failure) => throw failure, (data) => data));
});

class OpenChatController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<ChatEntity?> open({required String otherUserId, String? orderId}) async {
    state = const AsyncLoading();
    final usecase = GetOrCreateChat(ref.read(chatRepositoryProvider));
    final result = await usecase(GetOrCreateChatParams(otherUserId: otherUserId, orderId: orderId));
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return null;
      },
      (chat) {
        state = const AsyncData(null);
        return chat;
      },
    );
  }
}

final openChatControllerProvider = AsyncNotifierProvider<OpenChatController, void>(OpenChatController.new);

class SendMessageController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> send({required String chatId, required String content}) async {
    final usecase = SendMessage(ref.read(chatRepositoryProvider));
    final result = await usecase(SendMessageParams(chatId: chatId, content: content));
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) => true,
    );
  }
}

final sendMessageControllerProvider =
    AsyncNotifierProvider<SendMessageController, void>(SendMessageController.new);

Future<void> markChatAsRead(WidgetRef ref, String chatId) async {
  await MarkAsRead(ref.read(chatRepositoryProvider))(chatId);
}
