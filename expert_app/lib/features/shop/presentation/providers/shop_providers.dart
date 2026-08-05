import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../material/domain/entities/material_entity.dart';
import '../../data/datasources/shop_remote_datasource.dart';
import '../../data/repositories/shop_repository_impl.dart';
import '../../domain/entities/shop_entity.dart';
import '../../domain/repositories/shop_repository.dart';
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
