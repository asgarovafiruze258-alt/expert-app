import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/review_entity.dart';
import '../repositories/review_repository.dart';

class GetReviewsForTargetParams {
  final ReviewTargetType targetType;
  final String targetId;

  const GetReviewsForTargetParams({required this.targetType, required this.targetId});
}

class GetReviewsForTarget implements UseCase<List<ReviewEntity>, GetReviewsForTargetParams> {
  final ReviewRepository repository;

  const GetReviewsForTarget(this.repository);

  @override
  Future<Either<Failure, List<ReviewEntity>>> call(GetReviewsForTargetParams params) {
    return repository.getReviewsForTarget(targetType: params.targetType, targetId: params.targetId);
  }
}
