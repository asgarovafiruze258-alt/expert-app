import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/category_entity.dart';
import '../repositories/home_repository.dart';

class GetCategoriesParams {
  final CategoryType type;

  const GetCategoriesParams({required this.type});
}

class GetCategories implements UseCase<List<CategoryEntity>, GetCategoriesParams> {
  final HomeRepository repository;

  const GetCategories(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(GetCategoriesParams params) {
    return repository.getCategories(type: params.type);
  }
}
