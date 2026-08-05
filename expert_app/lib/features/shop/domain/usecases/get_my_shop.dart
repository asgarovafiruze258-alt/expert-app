import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/shop_entity.dart';
import '../repositories/shop_repository.dart';

class GetMyShop implements UseCase<ShopEntity?, NoParams> {
  final ShopRepository repository;

  const GetMyShop(this.repository);

  @override
  Future<Either<Failure, ShopEntity?>> call(NoParams params) {
    return repository.getMyShop();
  }
}
