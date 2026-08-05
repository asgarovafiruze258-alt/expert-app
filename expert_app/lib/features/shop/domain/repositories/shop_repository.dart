import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../material/domain/entities/material_entity.dart';
import '../entities/shop_entity.dart';

abstract class ShopRepository {
  Future<Either<Failure, ShopEntity>> getShopDetail(String id);

  Future<Either<Failure, List<MaterialEntity>>> getShopMaterials(String shopId);

  /// Cari istifadəçinin mağazası varsa qaytarır, yoxdursa `null`.
  Future<Either<Failure, ShopEntity?>> getMyShop();

  Future<Either<Failure, ShopEntity>> createShop({
    required String name,
    String? address,
    String? rayon,
    required List<String> categoryIds,
  });
}
