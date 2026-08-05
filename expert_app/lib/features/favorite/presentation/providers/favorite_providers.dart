import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../material/domain/entities/material_entity.dart';
import '../../../material/presentation/providers/material_providers.dart';
import '../../../worker/domain/entities/worker_entity.dart';
import '../../../worker/presentation/providers/worker_providers.dart';
import '../../data/datasources/favorite_remote_datasource.dart';
import '../../data/repositories/favorite_repository_impl.dart';
import '../../domain/entities/favorite_entity.dart';
import '../../domain/repositories/favorite_repository.dart';
import '../../domain/usecases/get_favorite_ids.dart';
import '../../domain/usecases/toggle_favorite.dart';

final favoriteRemoteDataSourceProvider = Provider<FavoriteRemoteDataSource>((ref) {
  return FavoriteRemoteDataSourceImpl(ref.watch(supabaseClientProvider));
});

final favoriteRepositoryProvider = Provider<FavoriteRepository>((ref) {
  return FavoriteRepositoryImpl(ref.watch(favoriteRemoteDataSourceProvider), ref.watch(supabaseClientProvider));
});

final favoriteIdsProvider =
    FutureProvider.family<List<String>, FavoriteTargetType>((ref, targetType) async {
  final result = await GetFavoriteIds(ref.watch(favoriteRepositoryProvider))(targetType);
  return result.fold((failure) => throw failure, (data) => data);
});

Future<void> toggleFavorite(WidgetRef ref, FavoriteTargetType targetType, String targetId) async {
  final result = await ToggleFavorite(ref.read(favoriteRepositoryProvider))(
    ToggleFavoriteParams(targetType: targetType, targetId: targetId),
  );
  result.fold((failure) => throw failure, (_) {});
  ref.invalidate(favoriteIdsProvider(targetType));
}

final favoriteWorkersProvider = FutureProvider<List<WorkerEntity>>((ref) async {
  final ids = await ref.watch(favoriteIdsProvider(FavoriteTargetType.worker).future);
  final repository = ref.watch(workerRepositoryProvider);
  final entities = <WorkerEntity>[];
  for (final id in ids) {
    final result = await repository.getWorkerDetail(id);
    result.fold((_) {}, entities.add);
  }
  return entities;
});

final favoriteMaterialsProvider = FutureProvider<List<MaterialEntity>>((ref) async {
  final ids = await ref.watch(favoriteIdsProvider(FavoriteTargetType.material).future);
  final repository = ref.watch(materialRepositoryProvider);
  final entities = <MaterialEntity>[];
  for (final id in ids) {
    final result = await repository.getMaterialDetail(id);
    result.fold((_) {}, entities.add);
  }
  return entities;
});
