import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/material_entity.dart';

abstract class MaterialRepository {
  Future<Either<Failure, List<MaterialEntity>>> getMaterials({
    String? categoryId,
    bool? sortByPriceAsc,
  });

  Future<Either<Failure, MaterialEntity>> getMaterialDetail(String id);

  Future<Either<Failure, List<MaterialEntity>>> getSimilarInOtherShops({
    required String name,
    required String excludeMaterialId,
  });
}
