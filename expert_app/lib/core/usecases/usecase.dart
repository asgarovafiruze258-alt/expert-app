import 'package:fpdart/fpdart.dart';

import '../errors/failure.dart';

abstract class UseCase<R, Params> {
  Future<Either<Failure, R>> call(Params params);
}

abstract class StreamUseCase<R, Params> {
  Stream<Either<Failure, R>> call(Params params);
}

class NoParams {
  const NoParams();
}
