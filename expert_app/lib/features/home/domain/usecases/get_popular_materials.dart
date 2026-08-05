import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../material/domain/entities/material_entity.dart';
import '../repositories/home_repository.dart';

class GetPopularMaterials implements UseCase<List<MaterialEntity>, NoParams> {
  final HomeRepository repository;

  const GetPopularMaterials(this.repository);

  @override
  Future<Either<Failure, List<MaterialEntity>>> call(NoParams params) {
    return repository.getPopularMaterials();
  }
}
