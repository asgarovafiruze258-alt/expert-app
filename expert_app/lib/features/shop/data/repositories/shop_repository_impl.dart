import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../material/domain/entities/material_entity.dart';
import '../../domain/entities/shop_entity.dart';
import '../../domain/repositories/shop_repository.dart';
import '../datasources/shop_remote_datasource.dart';

class ShopRepositoryImpl implements ShopRepository {
  final ShopRemoteDataSource remoteDataSource;

  const ShopRepositoryImpl(this.remoteDataSource);

  Failure _mapException(Object error) {
    if (error is ServerException) return Failure.server(message: error.message);
    if (error is NetworkException) return Failure.network(message: error.message);
    return Failure.unexpected(message: error.toString());
  }

  @override
  Future<Either<Failure, ShopEntity>> getShopDetail(String id) async {
    try {
      final model = await remoteDataSource.getShopDetail(id);
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Either<Failure, List<MaterialEntity>>> getShopMaterials(String shopId) async {
    try {
      final models = await remoteDataSource.getShopMaterials(shopId);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(_mapException(e));
    }
  }
}
