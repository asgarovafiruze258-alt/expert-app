import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/datasources/worker_remote_datasource.dart';
import '../../data/repositories/worker_repository_impl.dart';
import '../../domain/entities/worker_entity.dart';
import '../../domain/repositories/worker_repository.dart';
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
