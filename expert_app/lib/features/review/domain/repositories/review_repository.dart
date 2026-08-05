import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/review_entity.dart';

abstract class ReviewRepository {
  Future<Either<Failure, List<ReviewEntity>>> getReviewsForTarget({
    required ReviewTargetType targetType,
    required String targetId,
  });
}
