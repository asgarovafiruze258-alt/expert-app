import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/material_entity.dart';
import '../repositories/material_repository.dart';

class GetMaterialDetail implements UseCase<MaterialEntity, String> {
  final MaterialRepository repository;

  const GetMaterialDetail(this.repository);

  @override
  Future<Either<Failure, MaterialEntity>> call(String id) {
    return repository.getMaterialDetail(id);
  }
}
