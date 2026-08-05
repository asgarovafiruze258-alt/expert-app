import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../home/domain/entities/category_entity.dart';
import '../../../shop/domain/entities/shop_entity.dart';
import '../../../worker/domain/entities/worker_entity.dart';
import '../../domain/entities/admin_stats_entity.dart';
import '../../domain/repositories/admin_repository.dart';
import '../datasources/admin_remote_datasource.dart';

class AdminRepositoryImpl implements AdminRepository {
  final AdminRemoteDataSource remoteDataSource;

  const AdminRepositoryImpl(this.remoteDataSource);

  Failure _mapException(Object error) {
    if (error is ServerException) return Failure.server(message: error.message);
    if (error is NetworkException) return Failure.network(message: error.message);
    return Failure.unexpected(message: error.toString());
  }

  @override
  Future<Either<Failure, AdminStatsEntity>> getStats() async {
    try {
      return Right(await remoteDataSource.getStats());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      final models = await remoteDataSource.getAllCategories();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> createCategory({
    required String name,
    String? nameEn,
    String? nameRu,
    required CategoryType type,
  }) async {
    try {
      final model = await remoteDataSource.createCategory(
        name: name,
        nameEn: nameEn,
        nameRu: nameRu,
        type: type.name,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> updateCategory({
    required String id,
    required String name,
    String? nameEn,
    String? nameRu,
  }) async {
    try {
      final model = await remoteDataSource.updateCategory(
        id: id,
        name: name,
        nameEn: nameEn,
        nameRu: nameRu,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCategory(String id) async {
    try {
      await remoteDataSource.deleteCategory(id);
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, List<WorkerEntity>>> getPendingWorkers() async {
    try {
      final models = await remoteDataSource.getPendingWorkers();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> approveWorker(String id) async {
    try {
      await remoteDataSource.approveWorker(id);
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> rejectWorker(String id) async {
    try {
      await remoteDataSource.rejectWorker(id);
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, List<ShopEntity>>> getPendingShops() async {
    try {
      final models = await remoteDataSource.getPendingShops();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> approveShop(String id) async {
    try {
      await remoteDataSource.approveShop(id);
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> rejectShop(String id) async {
    try {
      await remoteDataSource.rejectShop(id);
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() async {
    try {
      final models = await remoteDataSource.getUsers();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserRole({required String userId, required UserRole role}) async {
    try {
      const roleValues = {
        UserRole.customer: 'customer',
        UserRole.worker: 'worker',
        UserRole.shopOwner: 'shop_owner',
        UserRole.admin: 'admin',
      };
      await remoteDataSource.updateUserRole(userId: userId, role: roleValues[role]!);
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }
}
