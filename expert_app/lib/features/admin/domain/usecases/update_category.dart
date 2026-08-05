import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../home/domain/entities/category_entity.dart';
import '../repositories/admin_repository.dart';

class UpdateCategoryParams {
  final String id;
  final String name;
  final String? nameEn;
  final String? nameRu;

  const UpdateCategoryParams({
    required this.id,
    required this.name,
    this.nameEn,
    this.nameRu,
  });
}

class UpdateCategory implements UseCase<CategoryEntity, UpdateCategoryParams> {
  final AdminRepository repository;

  const UpdateCategory(this.repository);

  @override
  Future<Either<Failure, CategoryEntity>> call(UpdateCategoryParams params) {
    return repository.updateCategory(
      id: params.id,
      name: params.name,
      nameEn: params.nameEn,
      nameRu: params.nameRu,
    );
  }
}
