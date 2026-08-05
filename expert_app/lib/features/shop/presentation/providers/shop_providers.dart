import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../material/domain/entities/material_entity.dart';
import '../../data/datasources/shop_remote_datasource.dart';
import '../../data/repositories/shop_repository_impl.dart';
import '../../domain/entities/shop_entity.dart';
import '../../domain/repositories/shop_repository.dart';
import '../../domain/usecases/create_shop.dart';
import '../../domain/usecases/get_my_shop.dart';
import '../../domain/usecases/get_shop_detail.dart';
import '../../domain/usecases/get_shop_materials.dart';

final shopRemoteDataSourceProvider = Provider<ShopRemoteDataSource>((ref) {
  return ShopRemoteDataSourceImpl(ref.watch(supabaseClientProvider));
});

final shopRepositoryProvider = Provider<ShopRepository>((ref) {
  return ShopRepositoryImpl(ref.watch(shopRemoteDataSourceProvider));
});

final shopDetailProvider = FutureProvider.family<ShopEntity, String>((ref, id) async {
  final result = await GetShopDetail(ref.watch(shopRepositoryProvider))(id);
  return result.fold((failure) => throw failure, (data) => data);
});

final shopMaterialsProvider = FutureProvider.family<List<MaterialEntity>, String>((ref, shopId) async {
  final result = await GetShopMaterials(ref.watch(shopRepositoryProvider))(shopId);
  return result.fold((failure) => throw failure, (data) => data);
});

/// Cari istifadəçinin mağazası varsa (təsdiqli və ya gözləmədə) qaytarır.
final myShopProvider = FutureProvider<ShopEntity?>((ref) async {
  final result = await GetMyShop(ref.watch(shopRepositoryProvider))(const NoParams());
  return result.fold((failure) => throw failure, (data) => data);
});

class OpenShopController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> submit({
    required String name,
    String? address,
    String? rayon,
    double? latitude,
    double? longitude,
    String? contactPhone,
    required List<String> categoryIds,
  }) async {
    state = const AsyncLoading();
    final usecase = CreateShop(ref.read(shopRepositoryProvider));
    final result = await usecase(CreateShopParams(
      name: name,
      address: address,
      rayon: rayon,
      latitude: latitude,
      longitude: longitude,
      contactPhone: contactPhone,
      categoryIds: categoryIds,
    ));
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(myShopProvider);
        return true;
      },
    );
  }
}

final openShopControllerProvider = AsyncNotifierProvider<OpenShopController, void>(OpenShopController.new);
