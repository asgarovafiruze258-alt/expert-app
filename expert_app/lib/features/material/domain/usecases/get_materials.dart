import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/material_entity.dart';
import '../repositories/material_repository.dart';

class GetMaterialsParams {
  final String? categoryId;
  final bool? sortByPriceAsc;

  const GetMaterialsParams({this.categoryId, this.sortByPriceAsc});
}

class GetMaterials implements UseCase<List<MaterialEntity>, GetMaterialsParams> {
  final MaterialRepository repository;

  const GetMaterials(this.repository);

  @override
  Future<Either<Failure, List<MaterialEntity>>> call(GetMaterialsParams params) {
    return repository.getMaterials(
      categoryId: params.categoryId,
      sortByPriceAsc: params.sortByPriceAsc,
    );
  }
}
