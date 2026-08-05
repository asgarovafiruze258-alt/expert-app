import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/material_entity.dart';
import '../repositories/material_repository.dart';

class GetSimilarMaterialsParams {
  final String name;
  final String excludeMaterialId;

  const GetSimilarMaterialsParams({required this.name, required this.excludeMaterialId});
}

class GetSimilarMaterials implements UseCase<List<MaterialEntity>, GetSimilarMaterialsParams> {
  final MaterialRepository repository;

  const GetSimilarMaterials(this.repository);

  @override
  Future<Either<Failure, List<MaterialEntity>>> call(GetSimilarMaterialsParams params) {
    return repository.getSimilarInOtherShops(
      name: params.name,
      excludeMaterialId: params.excludeMaterialId,
    );
  }
}
