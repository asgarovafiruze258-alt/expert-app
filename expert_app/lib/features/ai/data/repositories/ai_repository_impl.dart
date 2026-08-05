import 'dart:convert';

import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../project/domain/entities/project_item_entity.dart';
import '../../domain/entities/ai_chat_message_entity.dart';
import '../../domain/entities/budget_estimate_entity.dart';
import '../../domain/repositories/ai_repository.dart';
import '../datasources/ai_remote_datasource.dart';

class AiRepositoryImpl implements AiRepository {
  final AiRemoteDataSource remoteDataSource;

  const AiRepositoryImpl(this.remoteDataSource);

  Failure _mapException(Object error) {
    if (error is ServerException) return Failure.server(message: error.message);
    if (error is NetworkException) return Failure.network(message: error.message);
    return Failure.unexpected(message: error.toString());
  }

  static ProjectItemType _itemTypeFromString(String value) {
    switch (value) {
      case 'material':
        return ProjectItemType.material;
      case 'worker':
        return ProjectItemType.worker;
      case 'work':
      default:
        return ProjectItemType.work;
    }
  }

  @override
  Future<Either<Failure, String>> sendChatMessage({
    required String prompt,
    required List<AiChatMessageEntity> history,
  }) async {
    try {
      final text = await remoteDataSource.invoke(
        mode: 'chat',
        prompt: prompt,
        history: history
            .map((m) => {
                  'role': m.role == AiMessageRole.user ? 'user' : 'assistant',
                  'content': m.content,
                })
            .toList(),
      );
      return Right(text);
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, BudgetEstimateEntity>> estimateBudget(String description) async {
    try {
      final text = await remoteDataSource.invoke(mode: 'budget_estimate', prompt: description);
      final cleaned = text.trim().replaceAll(RegExp(r'^```json|```$', multiLine: true), '').trim();
      final json = jsonDecode(cleaned) as Map<String, dynamic>;
      final items = (json['items'] as List? ?? const [])
          .map((item) => BudgetEstimateItemEntity(
                itemType: _itemTypeFromString((item as Map)['itemType'] as String? ?? 'work'),
                label: item['label'] as String? ?? '',
                estimatedCost: (item['estimatedCost'] as num?)?.toDouble() ?? 0,
              ))
          .toList();
      return Right(BudgetEstimateEntity(
        estimatedBudget: (json['estimatedBudget'] as num?)?.toDouble() ?? 0,
        items: items,
      ));
    } catch (e) {
      return Left(_mapException(e));
    }
  }
}
