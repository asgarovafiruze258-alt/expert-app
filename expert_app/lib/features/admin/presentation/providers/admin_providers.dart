import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../home/domain/entities/category_entity.dart';
import '../../../order/domain/entities/order_entity.dart';
import '../../../shop/domain/entities/shop_entity.dart';
import '../../../worker/domain/entities/worker_entity.dart';
import '../../../worker/presentation/providers/worker_providers.dart';
import '../../data/datasources/admin_remote_datasource.dart';
import '../../data/repositories/admin_repository_impl.dart';
import '../../domain/entities/admin_stats_entity.dart';
import '../../domain/repositories/admin_repository.dart';
import '../../domain/usecases/approve_shop.dart';
import '../../domain/usecases/approve_worker.dart';
import '../../domain/usecases/create_category.dart';
import '../../domain/usecases/delete_category.dart';
import '../../domain/usecases/get_admin_stats.dart';
import '../../domain/usecases/get_all_categories.dart';
import '../../domain/usecases/get_all_shops.dart';
import '../../domain/usecases/get_all_workers.dart';
import '../../domain/usecases/get_orders.dart';
import '../../domain/usecases/get_pending_shops.dart';
import '../../domain/usecases/get_pending_workers.dart';
import '../../domain/usecases/get_users.dart';
import '../../domain/usecases/reject_shop.dart';
import '../../domain/usecases/reject_worker.dart';
import '../../domain/usecases/update_category.dart';
import '../../domain/usecases/update_user_role.dart';

final adminRemoteDataSourceProvider = Provider<AdminRemoteDataSource>((ref) {
  return AdminRemoteDataSourceImpl(ref.watch(supabaseClientProvider));
});

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  return AdminRepositoryImpl(ref.watch(adminRemoteDataSourceProvider));
});

final adminStatsProvider = FutureProvider<AdminStatsEntity>((ref) async {
  final result = await GetAdminStats(ref.watch(adminRepositoryProvider))(const NoParams());
  return result.fold((failure) => throw failure, (data) => data);
});

final allCategoriesProvider = FutureProvider<List<CategoryEntity>>((ref) async {
  final result = await GetAllCategories(ref.watch(adminRepositoryProvider))(const NoParams());
  return result.fold((failure) => throw failure, (data) => data);
});

final pendingWorkersProvider = FutureProvider<List<WorkerEntity>>((ref) async {
  final result = await GetPendingWorkers(ref.watch(adminRepositoryProvider))(const NoParams());
  return result.fold((failure) => throw failure, (data) => data);
});

final pendingShopsProvider = FutureProvider<List<ShopEntity>>((ref) async {
  final result = await GetPendingShops(ref.watch(adminRepositoryProvider))(const NoParams());
  return result.fold((failure) => throw failure, (data) => data);
});

final allWorkersAdminProvider = FutureProvider<List<WorkerEntity>>((ref) async {
  final result = await GetAllWorkers(ref.watch(adminRepositoryProvider))(const NoParams());
  return result.fold((failure) => throw failure, (data) => data);
});

final allShopsAdminProvider = FutureProvider<List<ShopEntity>>((ref) async {
  final result = await GetAllShops(ref.watch(adminRepositoryProvider))(const NoParams());
  return result.fold((failure) => throw failure, (data) => data);
});

final adminOrdersProvider = FutureProvider<List<OrderEntity>>((ref) async {
  final result = await GetOrders(ref.watch(adminRepositoryProvider))(const NoParams());
  return result.fold((failure) => throw failure, (data) => data);
});

final adminUsersProvider = FutureProvider<List<UserEntity>>((ref) async {
  final result = await GetUsers(ref.watch(adminRepositoryProvider))(const NoParams());
  return result.fold((failure) => throw failure, (data) => data);
});

class CategoryAdminController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> create({
    required String name,
    String? nameEn,
    String? nameRu,
    required CategoryType type,
  }) async {
    state = const AsyncLoading();
    final usecase = CreateCategory(ref.read(adminRepositoryProvider));
    final result =
        await usecase(CreateCategoryParams(name: name, nameEn: nameEn, nameRu: nameRu, type: type));
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(allCategoriesProvider);
        return true;
      },
    );
  }

  Future<bool> updateCategory({
    required String id,
    required String name,
    String? nameEn,
    String? nameRu,
  }) async {
    state = const AsyncLoading();
    final usecase = UpdateCategory(ref.read(adminRepositoryProvider));
    final result =
        await usecase(UpdateCategoryParams(id: id, name: name, nameEn: nameEn, nameRu: nameRu));
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(allCategoriesProvider);
        return true;
      },
    );
  }

  Future<bool> delete(String id) async {
    state = const AsyncLoading();
    final usecase = DeleteCategory(ref.read(adminRepositoryProvider));
    final result = await usecase(id);
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(allCategoriesProvider);
        return true;
      },
    );
  }
}

final categoryAdminControllerProvider =
    AsyncNotifierProvider<CategoryAdminController, void>(CategoryAdminController.new);

class WorkerApprovalController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> approve(String id) async {
    state = const AsyncLoading();
    final result = await ApproveWorker(ref.read(adminRepositoryProvider))(id);
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(pendingWorkersProvider);
        ref.invalidate(allWorkersAdminProvider);
        ref.invalidate(adminStatsProvider);
        ref.invalidate(workersListProvider(null));
        return true;
      },
    );
  }

  Future<bool> reject(String id) async {
    state = const AsyncLoading();
    final result = await RejectWorker(ref.read(adminRepositoryProvider))(id);
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(pendingWorkersProvider);
        ref.invalidate(allWorkersAdminProvider);
        ref.invalidate(adminStatsProvider);
        return true;
      },
    );
  }
}

final workerApprovalControllerProvider =
    AsyncNotifierProvider<WorkerApprovalController, void>(WorkerApprovalController.new);

class ShopApprovalController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> approve(String id) async {
    state = const AsyncLoading();
    final result = await ApproveShop(ref.read(adminRepositoryProvider))(id);
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(pendingShopsProvider);
        ref.invalidate(allShopsAdminProvider);
        ref.invalidate(adminStatsProvider);
        return true;
      },
    );
  }

  Future<bool> reject(String id) async {
    state = const AsyncLoading();
    final result = await RejectShop(ref.read(adminRepositoryProvider))(id);
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(pendingShopsProvider);
        ref.invalidate(allShopsAdminProvider);
        ref.invalidate(adminStatsProvider);
        return true;
      },
    );
  }
}

final shopApprovalControllerProvider =
    AsyncNotifierProvider<ShopApprovalController, void>(ShopApprovalController.new);

class UserRoleController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> updateRole({required String userId, required UserRole role}) async {
    state = const AsyncLoading();
    final usecase = UpdateUserRole(ref.read(adminRepositoryProvider));
    final result = await usecase(UpdateUserRoleParams(userId: userId, role: role));
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(adminUsersProvider);
        return true;
      },
    );
  }
}

final userRoleControllerProvider =
    AsyncNotifierProvider<UserRoleController, void>(UserRoleController.new);
