import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/datasources/worker_remote_datasource.dart';
import '../../data/repositories/worker_repository_impl.dart';
import '../../domain/entities/worker_entity.dart';
import '../../domain/repositories/worker_repository.dart';
import '../../domain/usecases/create_worker_profile.dart';
import '../../domain/usecases/get_my_worker_profile.dart';
import '../../domain/usecases/get_worker_detail.dart';
import '../../domain/usecases/get_workers.dart';

final workerRemoteDataSourceProvider = Provider<WorkerRemoteDataSource>((ref) {
  return WorkerRemoteDataSourceImpl(ref.watch(supabaseClientProvider));
});

final workerRepositoryProvider = Provider<WorkerRepository>((ref) {
  return WorkerRepositoryImpl(ref.watch(workerRemoteDataSourceProvider));
});

final workersListProvider =
    FutureProvider.family<List<WorkerEntity>, String?>((ref, categoryId) async {
  final result =
      await GetWorkers(ref.watch(workerRepositoryProvider))(GetWorkersParams(categoryId: categoryId));
  return result.fold((failure) => throw failure, (data) => data);
});

final workerDetailProvider = FutureProvider.family<WorkerEntity, String>((ref, id) async {
  final result =
      await GetWorkerDetail(ref.watch(workerRepositoryProvider))(GetWorkerDetailParams(id: id));
  return result.fold((failure) => throw failure, (data) => data);
});

/// Cari istifadəçinin usta profili varsa (təsdiqli və ya gözləmədə) qaytarır.
final myWorkerProfileProvider = FutureProvider<WorkerEntity?>((ref) async {
  final result = await GetMyWorkerProfile(ref.watch(workerRepositoryProvider))(const NoParams());
  return result.fold((failure) => throw failure, (data) => data);
});

class BecomeWorkerController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> submit({
    required String bio,
    required int experienceYears,
    double? priceFrom,
    double? priceTo,
    required List<String> serviceAreas,
    String? contactPhone,
    required List<String> categoryIds,
  }) async {
    state = const AsyncLoading();
    final usecase = CreateWorkerProfile(ref.read(workerRepositoryProvider));
    final result = await usecase(CreateWorkerProfileParams(
      bio: bio,
      experienceYears: experienceYears,
      priceFrom: priceFrom,
      priceTo: priceTo,
      serviceAreas: serviceAreas,
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
        ref.invalidate(myWorkerProfileProvider);
        return true;
      },
    );
  }
}

final becomeWorkerControllerProvider =
    AsyncNotifierProvider<BecomeWorkerController, void>(BecomeWorkerController.new);
