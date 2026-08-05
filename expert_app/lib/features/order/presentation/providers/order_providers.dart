import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/datasources/order_remote_datasource.dart';
import '../../data/repositories/order_repository_impl.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../../domain/usecases/create_order.dart';

final orderRemoteDataSourceProvider = Provider<OrderRemoteDataSource>((ref) {
  return OrderRemoteDataSourceImpl(ref.watch(supabaseClientProvider));
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  return OrderRepositoryImpl(ref.watch(orderRemoteDataSourceProvider), ref.watch(supabaseClientProvider));
});

class CreateOrderController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> submit({
    required OrderTargetType targetType,
    required String targetId,
    String? address,
    DateTime? scheduledDate,
    String? notes,
  }) async {
    state = const AsyncLoading();
    final usecase = CreateOrder(ref.read(orderRepositoryProvider));
    final result = await usecase(CreateOrderParams(
      targetType: targetType,
      targetId: targetId,
      address: address,
      scheduledDate: scheduledDate,
      notes: notes,
    ));

    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        return true;
      },
    );
  }
}

final createOrderControllerProvider =
    AsyncNotifierProvider<CreateOrderController, void>(CreateOrderController.new);
