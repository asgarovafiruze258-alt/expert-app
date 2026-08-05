import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/chat_entity.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_datasource.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;
  final SupabaseClient client;

  const ChatRepositoryImpl(this.remoteDataSource, this.client);

  Failure _mapException(Object error) {
    if (error is ServerException) return Failure.server(message: error.message);
    if (error is NetworkException) return Failure.network(message: error.message);
    return Failure.unexpected(message: error.toString());
  }

  String? get _userId => client.auth.currentUser?.id;

  @override
  Future<Either<Failure, List<ChatEntity>>> getChats() async {
    try {
      final userId = _userId;
      if (userId == null) return const Left(Failure.unauthorized());
      final models = await remoteDataSource.getChats(userId);
      return Right(models.map((m) => m.toEntity(userId)).toList());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, ChatEntity>> getOrCreateChat({
    required String otherUserId,
    String? orderId,
  }) async {
    try {
      final userId = _userId;
      if (userId == null) return const Left(Failure.unauthorized());
      final existing = await remoteDataSource.findChat(userId: userId, otherUserId: otherUserId);
      final model = existing ??
          await remoteDataSource.createChat(userId: userId, otherUserId: otherUserId, orderId: orderId);
      return Right(model.toEntity(userId));
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Stream<Either<Failure, List<MessageEntity>>> watchMessages(String chatId) async* {
    try {
      await for (final models in remoteDataSource.watchMessages(chatId)) {
        yield Right(models.map((m) => m.toEntity()).toList());
      }
    } catch (e) {
      yield Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendMessage({required String chatId, required String content}) async {
    try {
      final userId = _userId;
      if (userId == null) return const Left(Failure.unauthorized());
      await remoteDataSource.sendMessage(chatId: chatId, senderId: userId, content: content);
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> markAsRead(String chatId) async {
    try {
      final userId = _userId;
      if (userId == null) return const Left(Failure.unauthorized());
      await remoteDataSource.markAsRead(chatId: chatId, userId: userId);
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }
}
