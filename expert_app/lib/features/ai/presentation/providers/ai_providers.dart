import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/datasources/ai_remote_datasource.dart';
import '../../data/repositories/ai_repository_impl.dart';
import '../../domain/entities/ai_chat_message_entity.dart';
import '../../domain/entities/budget_estimate_entity.dart';
import '../../domain/repositories/ai_repository.dart';
import '../../domain/usecases/estimate_budget.dart';
import '../../domain/usecases/send_chat_message.dart';

final aiRemoteDataSourceProvider = Provider<AiRemoteDataSource>((ref) {
  return AiRemoteDataSourceImpl(ref.watch(supabaseClientProvider));
});

final aiRepositoryProvider = Provider<AiRepository>((ref) {
  return AiRepositoryImpl(ref.watch(aiRemoteDataSourceProvider));
});

typedef AiChatState = ({List<AiChatMessageEntity> messages, bool isLoading, Failure? error});

class AiChatNotifier extends Notifier<AiChatState> {
  @override
  AiChatState build() => (messages: const [], isLoading: false, error: null);

  Future<void> send(String prompt) async {
    final history = state.messages;
    final userMessage = AiChatMessageEntity(role: AiMessageRole.user, content: prompt);
    state = (messages: [...state.messages, userMessage], isLoading: true, error: null);

    final usecase = SendChatMessage(ref.read(aiRepositoryProvider));
    final result = await usecase(SendChatMessageParams(prompt: prompt, history: history));

    result.fold(
      (failure) => state = (messages: state.messages, isLoading: false, error: failure),
      (reply) => state = (
        messages: [...state.messages, AiChatMessageEntity(role: AiMessageRole.assistant, content: reply)],
        isLoading: false,
        error: null,
      ),
    );
  }
}

final aiChatProvider = NotifierProvider<AiChatNotifier, AiChatState>(AiChatNotifier.new);

class BudgetEstimateController extends AsyncNotifier<BudgetEstimateEntity?> {
  @override
  FutureOr<BudgetEstimateEntity?> build() => null;

  Future<void> estimate(String description) async {
    state = const AsyncLoading();
    final usecase = EstimateBudget(ref.read(aiRepositoryProvider));
    final result = await usecase(description);
    result.fold(
      (failure) => state = AsyncError(failure, StackTrace.current),
      (data) => state = AsyncData(data),
    );
  }

  void clear() => state = const AsyncData(null);
}

final budgetEstimateControllerProvider =
    AsyncNotifierProvider<BudgetEstimateController, BudgetEstimateEntity?>(
        BudgetEstimateController.new);
