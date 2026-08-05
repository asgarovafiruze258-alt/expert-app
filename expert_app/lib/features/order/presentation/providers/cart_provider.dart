import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../material/domain/entities/material_entity.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/usecases/create_material_order.dart';
import 'order_providers.dart';

class CartNotifier extends Notifier<List<CartItemEntity>> {
  @override
  List<CartItemEntity> build() => [];

  void addItem(MaterialEntity material, int quantity) {
    final index = state.indexWhere((item) => item.material.id == material.id);
    if (index == -1) {
      state = [...state, CartItemEntity(material: material, quantity: quantity)];
      return;
    }
    final updated = state[index].copyWith(quantity: state[index].quantity + quantity);
    state = [
      for (final item in state) item.material.id == material.id ? updated : item,
    ];
  }

  void updateQuantity(String materialId, int quantity) {
    if (quantity <= 0) {
      removeItem(materialId);
      return;
    }
    state = [
      for (final item in state)
        item.material.id == materialId ? item.copyWith(quantity: quantity) : item,
    ];
  }

  void removeItem(String materialId) {
    state = state.where((item) => item.material.id != materialId).toList();
  }

  void clear() => state = [];
}

final cartProvider = NotifierProvider<CartNotifier, List<CartItemEntity>>(CartNotifier.new);

final cartTotalProvider = Provider<double>((ref) {
  final items = ref.watch(cartProvider);
  return items.fold(0.0, (sum, item) => sum + item.lineTotal);
});

final cartCountProvider = Provider<int>((ref) {
  final items = ref.watch(cartProvider);
  return items.fold(0, (sum, item) => sum + item.quantity);
});

class CartCheckoutController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> submit({String? address, DateTime? scheduledDate, String? notes}) async {
    final items = ref.read(cartProvider);
    if (items.isEmpty) return false;

    state = const AsyncLoading();
    final usecase = CreateMaterialOrder(ref.read(orderRepositoryProvider));
    final result = await usecase(CreateMaterialOrderParams(
      items: items,
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
        ref.read(cartProvider.notifier).clear();
        return true;
      },
    );
  }
}

final cartCheckoutControllerProvider =
    AsyncNotifierProvider<CartCheckoutController, void>(CartCheckoutController.new);
