import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/shop_entity.dart';
import '../repositories/shop_repository.dart';

class GetShopDetail implements UseCase<ShopEntity, String> {
  final ShopRepository repository;

  const GetShopDetail(this.repository);

  @override
  Future<Either<Failure, ShopEntity>> call(String id) {
    return repository.getShopDetail(id);
  }
}
