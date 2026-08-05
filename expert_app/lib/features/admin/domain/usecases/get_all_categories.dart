import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../home/domain/entities/category_entity.dart';
import '../repositories/admin_repository.dart';

class GetAllCategories implements UseCase<List<CategoryEntity>, NoParams> {
  final AdminRepository repository;

  const GetAllCategories(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) {
    return repository.getAllCategories();
  }
}
