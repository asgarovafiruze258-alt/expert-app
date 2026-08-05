import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../home/domain/entities/category_entity.dart';
import '../repositories/admin_repository.dart';

class CreateCategoryParams {
  final String name;
  final String? nameEn;
  final String? nameRu;
  final CategoryType type;

  const CreateCategoryParams({
    required this.name,
    this.nameEn,
    this.nameRu,
    required this.type,
  });
}

class CreateCategory implements UseCase<CategoryEntity, CreateCategoryParams> {
  final AdminRepository repository;

  const CreateCategory(this.repository);

  @override
  Future<Either<Failure, CategoryEntity>> call(CreateCategoryParams params) {
    return repository.createCategory(
      name: params.name,
      nameEn: params.nameEn,
      nameRu: params.nameRu,
      type: params.type,
    );
  }
}
