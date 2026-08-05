import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/material_entity.dart';
import '../../domain/repositories/material_repository.dart';
import '../datasources/material_remote_datasource.dart';

class MaterialRepositoryImpl implements MaterialRepository {
  final MaterialRemoteDataSource remoteDataSource;

  const MaterialRepositoryImpl(this.remoteDataSource);

  Failure _mapException(Object error) {
    if (error is ServerException) return Failure.server(message: error.message);
    if (error is NetworkException) return Failure.network(message: error.message);
    return Failure.unexpected(message: error.toString());
  }

  @override
  Future<Either<Failure, List<MaterialEntity>>> getMaterials({
    String? categoryId,
    bool? sortByPriceAsc,
  }) async {
    try {
      final models = await remoteDataSource.getMaterials(
        categoryId: categoryId,
        sortByPriceAsc: sortByPriceAsc,
      );
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, MaterialEntity>> getMaterialDetail(String id) async {
    try {
      final model = await remoteDataSource.getMaterialDetail(id);
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, List<MaterialEntity>>> getSimilarInOtherShops({
    required String name,
    required String excludeMaterialId,
  }) async {
    try {
      final models = await remoteDataSource.getSimilarInOtherShops(
        name: name,
        excludeMaterialId: excludeMaterialId,
      );
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapException(e));
    }
  }
}
