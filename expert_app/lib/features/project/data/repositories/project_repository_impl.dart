import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/project_entity.dart';
import '../../domain/entities/project_item_entity.dart';
import '../../domain/repositories/project_repository.dart';
import '../datasources/project_remote_datasource.dart';
import '../models/project_item_model.dart';
import '../models/project_model.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemoteDataSource remoteDataSource;
  final SupabaseClient client;

  const ProjectRepositoryImpl(this.remoteDataSource, this.client);

  Failure _mapException(Object error) {
    if (error is ServerException) return Failure.server(message: error.message);
    if (error is NetworkException) return Failure.network(message: error.message);
    return Failure.unexpected(message: error.toString());
  }

  String? get _userId => client.auth.currentUser?.id;

  @override
  Future<Either<Failure, List<ProjectEntity>>> getProjects() async {
    try {
      final userId = _userId;
      if (userId == null) return const Left(Failure.unauthorized());
      final models = await remoteDataSource.getProjects(userId);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, ProjectEntity>> getProjectDetail(String id) async {
    try {
      final model = await remoteDataSource.getProjectDetail(id);
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, ProjectEntity>> createProject({
    required String title,
    int? roomCount,
    double? budgetPlanned,
  }) async {
    try {
      final userId = _userId;
      if (userId == null) return const Left(Failure.unauthorized());
      final model = await remoteDataSource.createProject(
        userId: userId,
        title: title,
        roomCount: roomCount,
        budgetPlanned: budgetPlanned,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateProjectStatus({
    required String id,
    required ProjectStatus status,
  }) async {
    try {
      await remoteDataSource.updateProjectStatus(id: id, status: status.dbValue);
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProject(String id) async {
    try {
      await remoteDataSource.deleteProject(id);
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, List<ProjectItemEntity>>> getProjectItems(String projectId) async {
    try {
      final models = await remoteDataSource.getProjectItems(projectId);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, ProjectItemEntity>> addProjectItem({
    required String projectId,
    required ProjectItemType itemType,
    required String label,
    required double estimatedCost,
    double? actualCost,
  }) async {
    try {
      final model = await remoteDataSource.addProjectItem(
        projectId: projectId,
        itemType: itemType.dbValue,
        label: label,
        estimatedCost: estimatedCost,
        actualCost: actualCost,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateProjectItemActualCost({
    required String id,
    required double actualCost,
  }) async {
    try {
      await remoteDataSource.updateProjectItemActualCost(id: id, actualCost: actualCost);
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProjectItem(String id) async {
    try {
      await remoteDataSource.deleteProjectItem(id);
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }
}
