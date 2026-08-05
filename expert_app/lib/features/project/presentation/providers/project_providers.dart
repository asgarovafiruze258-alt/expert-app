import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/datasources/project_remote_datasource.dart';
import '../../data/repositories/project_repository_impl.dart';
import '../../domain/entities/project_entity.dart';
import '../../domain/entities/project_item_entity.dart';
import '../../domain/repositories/project_repository.dart';
import '../../domain/usecases/add_project_item.dart';
import '../../domain/usecases/create_project.dart';
import '../../domain/usecases/delete_project.dart';
import '../../domain/usecases/delete_project_item.dart';
import '../../domain/usecases/get_project_detail.dart';
import '../../domain/usecases/get_project_items.dart';
import '../../domain/usecases/get_projects.dart';
import '../../domain/usecases/update_project_item_actual_cost.dart';
import '../../domain/usecases/update_project_status.dart';

final projectRemoteDataSourceProvider = Provider<ProjectRemoteDataSource>((ref) {
  return ProjectRemoteDataSourceImpl(ref.watch(supabaseClientProvider));
});

final projectRepositoryProvider = Provider<ProjectRepository>((ref) {
  return ProjectRepositoryImpl(ref.watch(projectRemoteDataSourceProvider), ref.watch(supabaseClientProvider));
});

final projectsListProvider = FutureProvider<List<ProjectEntity>>((ref) async {
  final result = await GetProjects(ref.watch(projectRepositoryProvider))(const NoParams());
  return result.fold((failure) => throw failure, (data) => data);
});

final projectDetailProvider = FutureProvider.family<ProjectEntity, String>((ref, id) async {
  final result = await GetProjectDetail(ref.watch(projectRepositoryProvider))(id);
  return result.fold((failure) => throw failure, (data) => data);
});

final projectItemsProvider = FutureProvider.family<List<ProjectItemEntity>, String>((ref, projectId) async {
  final result = await GetProjectItems(ref.watch(projectRepositoryProvider))(projectId);
  return result.fold((failure) => throw failure, (data) => data);
});

class ProjectController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> create({required String title, int? roomCount, double? budgetPlanned}) async {
    state = const AsyncLoading();
    final usecase = CreateProject(ref.read(projectRepositoryProvider));
    final result = await usecase(
      CreateProjectParams(title: title, roomCount: roomCount, budgetPlanned: budgetPlanned),
    );
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(projectsListProvider);
        return true;
      },
    );
  }

  Future<bool> updateStatus(String id, ProjectStatus status) async {
    state = const AsyncLoading();
    final usecase = UpdateProjectStatus(ref.read(projectRepositoryProvider));
    final result = await usecase(UpdateProjectStatusParams(id: id, status: status));
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(projectDetailProvider(id));
        ref.invalidate(projectsListProvider);
        return true;
      },
    );
  }

  Future<bool> delete(String id) async {
    state = const AsyncLoading();
    final usecase = DeleteProject(ref.read(projectRepositoryProvider));
    final result = await usecase(id);
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(projectsListProvider);
        return true;
      },
    );
  }
}

final projectControllerProvider = AsyncNotifierProvider<ProjectController, void>(ProjectController.new);

class ProjectItemController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> add({
    required String projectId,
    required ProjectItemType itemType,
    required String label,
    required double estimatedCost,
    double? actualCost,
  }) async {
    state = const AsyncLoading();
    final usecase = AddProjectItem(ref.read(projectRepositoryProvider));
    final result = await usecase(AddProjectItemParams(
      projectId: projectId,
      itemType: itemType,
      label: label,
      estimatedCost: estimatedCost,
      actualCost: actualCost,
    ));
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(projectItemsProvider(projectId));
        ref.invalidate(projectDetailProvider(projectId));
        return true;
      },
    );
  }

  Future<bool> updateActualCost({
    required String id,
    required String projectId,
    required double actualCost,
  }) async {
    state = const AsyncLoading();
    final usecase = UpdateProjectItemActualCost(ref.read(projectRepositoryProvider));
    final result = await usecase(UpdateProjectItemActualCostParams(id: id, actualCost: actualCost));
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(projectItemsProvider(projectId));
        ref.invalidate(projectDetailProvider(projectId));
        return true;
      },
    );
  }

  Future<bool> remove({required String id, required String projectId}) async {
    state = const AsyncLoading();
    final usecase = DeleteProjectItem(ref.read(projectRepositoryProvider));
    final result = await usecase(id);
    return result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        ref.invalidate(projectItemsProvider(projectId));
        ref.invalidate(projectDetailProvider(projectId));
        return true;
      },
    );
  }
}

final projectItemControllerProvider =
    AsyncNotifierProvider<ProjectItemController, void>(ProjectItemController.new);
