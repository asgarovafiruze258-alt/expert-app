import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/shop_entity.dart';
import '../repositories/shop_repository.dart';

class CreateShopParams {
  final String name;
  final String? address;
  final String? rayon;
  final List<String> categoryIds;

  const CreateShopParams({
    required this.name,
    this.address,
    this.rayon,
    required this.categoryIds,
  });
}

class CreateShop implements UseCase<ShopEntity, CreateShopParams> {
  final ShopRepository repository;

  const CreateShop(this.repository);

  @override
  Future<Either<Failure, ShopEntity>> call(CreateShopParams params) {
    return repository.createShop(
      name: params.name,
      address: params.address,
      rayon: params.rayon,
      categoryIds: params.categoryIds,
    );
  }
}
