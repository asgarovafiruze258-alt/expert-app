import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../home/domain/entities/category_entity.dart';
import '../../../shop/domain/entities/shop_entity.dart';
import '../../../worker/domain/entities/worker_entity.dart';
import '../entities/admin_stats_entity.dart';

abstract class AdminRepository {
  Future<Either<Failure, AdminStatsEntity>> getStats();

  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
  Future<Either<Failure, CategoryEntity>> createCategory({
    required String name,
    String? nameEn,
    String? nameRu,
    required CategoryType type,
  });
  Future<Either<Failure, CategoryEntity>> updateCategory({
    required String id,
    required String name,
    String? nameEn,
    String? nameRu,
  });
  Future<Either<Failure, Unit>> deleteCategory(String id);

  Future<Either<Failure, List<WorkerEntity>>> getPendingWorkers();
  Future<Either<Failure, Unit>> approveWorker(String id);
  Future<Either<Failure, Unit>> rejectWorker(String id);

  Future<Either<Failure, List<ShopEntity>>> getPendingShops();
  Future<Either<Failure, Unit>> approveShop(String id);
  Future<Either<Failure, Unit>> rejectShop(String id);

  Future<Either<Failure, List<UserEntity>>> getUsers();
  Future<Either<Failure, Unit>> updateUserRole({required String userId, required UserRole role});
}
