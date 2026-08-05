import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../shop/domain/entities/shop_entity.dart';
import '../repositories/admin_repository.dart';

class GetAllShops implements UseCase<List<ShopEntity>, NoParams> {
  final AdminRepository repository;

  const GetAllShops(this.repository);

  @override
  Future<Either<Failure, List<ShopEntity>>> call(NoParams params) {
    return repository.getAllShops();
  }
}
