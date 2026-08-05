import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/datasources/material_remote_datasource.dart';
import '../../data/repositories/material_repository_impl.dart';
import '../../domain/entities/material_entity.dart';
import '../../domain/repositories/material_repository.dart';
import '../../domain/usecases/get_material_detail.dart';
import '../../domain/usecases/get_materials.dart';
import '../../domain/usecases/get_similar_materials.dart';

final materialRemoteDataSourceProvider = Provider<MaterialRemoteDataSource>((ref) {
  return MaterialRemoteDataSourceImpl(ref.watch(supabaseClientProvider));
});

final materialRepositoryProvider = Provider<MaterialRepository>((ref) {
  return MaterialRepositoryImpl(ref.watch(materialRemoteDataSourceProvider));
});

typedef MaterialsQuery = ({String? categoryId, bool? sortByPriceAsc});

final materialsListProvider =
    FutureProvider.family<List<MaterialEntity>, MaterialsQuery>((ref, query) async {
  final result = await GetMaterials(ref.watch(materialRepositoryProvider))(
    GetMaterialsParams(categoryId: query.categoryId, sortByPriceAsc: query.sortByPriceAsc),
  );
  return result.fold((failure) => throw failure, (data) => data);
});

final materialDetailProvider = FutureProvider.family<MaterialEntity, String>((ref, id) async {
  final result = await GetMaterialDetail(ref.watch(materialRepositoryProvider))(id);
  return result.fold((failure) => throw failure, (data) => data);
});

typedef SimilarMaterialsQuery = ({String name, String excludeMaterialId});

final similarMaterialsProvider =
    FutureProvider.family<List<MaterialEntity>, SimilarMaterialsQuery>((ref, query) async {
  final result = await GetSimilarMaterials(ref.watch(materialRepositoryProvider))(
    GetSimilarMaterialsParams(name: query.name, excludeMaterialId: query.excludeMaterialId),
  );
  return result.fold((failure) => throw failure, (data) => data);
});
