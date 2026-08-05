import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/shared_preferences_provider.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../material/domain/entities/material_entity.dart';
import '../../../worker/domain/entities/worker_entity.dart';
import '../../data/datasources/home_remote_datasource.dart';
import '../../data/datasources/recently_viewed_local_datasource.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/recently_viewed_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_discounted_materials.dart';
import '../../domain/usecases/get_popular_materials.dart';
import '../../domain/usecases/get_popular_workers.dart';
import '../../domain/usecases/get_recently_viewed.dart';

final homeRemoteDataSourceProvider = Provider<HomeRemoteDataSource>((ref) {
  return HomeRemoteDataSourceImpl(ref.watch(supabaseClientProvider));
});

final recentlyViewedLocalDataSourceProvider = Provider<RecentlyViewedLocalDataSource>((ref) {
  return RecentlyViewedLocalDataSourceImpl(ref.watch(sharedPreferencesProvider));
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl(
    ref.watch(homeRemoteDataSourceProvider),
    ref.watch(recentlyViewedLocalDataSourceProvider),
  );
});

final workerCategoriesProvider = FutureProvider<List<CategoryEntity>>((ref) async {
  final result = await GetCategories(ref.watch(homeRepositoryProvider))(
    const GetCategoriesParams(type: CategoryType.worker),
  );
  return result.fold((failure) => throw failure, (data) => data);
});

final popularWorkersProvider = FutureProvider<List<WorkerEntity>>((ref) async {
  final result = await GetPopularWorkers(ref.watch(homeRepositoryProvider))(const NoParams());
  return result.fold((failure) => throw failure, (data) => data);
});

final popularMaterialsProvider = FutureProvider<List<MaterialEntity>>((ref) async {
  final result = await GetPopularMaterials(ref.watch(homeRepositoryProvider))(const NoParams());
  return result.fold((failure) => throw failure, (data) => data);
});

final discountedMaterialsProvider = FutureProvider<List<MaterialEntity>>((ref) async {
  final result = await GetDiscountedMaterials(ref.watch(homeRepositoryProvider))(const NoParams());
  return result.fold((failure) => throw failure, (data) => data);
});

final recentlyViewedProvider = FutureProvider<List<RecentlyViewedEntity>>((ref) async {
  final result = await GetRecentlyViewed(ref.watch(homeRepositoryProvider))(const NoParams());
  return result.fold((failure) => throw failure, (data) => data);
});
