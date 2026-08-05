import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/home_repository.dart';

class SearchAllParams {
  final String query;

  const SearchAllParams({required this.query});
}

class SearchAll implements UseCase<SearchResults, SearchAllParams> {
  final HomeRepository repository;

  const SearchAll(this.repository);

  @override
  Future<Either<Failure, SearchResults>> call(SearchAllParams params) {
    return repository.search(params.query);
  }
}
