import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../material/domain/entities/material_entity.dart';
import '../repositories/shop_repository.dart';

class GetShopMaterials implements UseCase<List<MaterialEntity>, String> {
  final ShopRepository repository;

  const GetShopMaterials(this.repository);

  @override
  Future<Either<Failure, List<MaterialEntity>>> call(String shopId) {
    return repository.getShopMaterials(shopId);
  }
}
