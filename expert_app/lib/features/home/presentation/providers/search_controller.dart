import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/search_all.dart';
import 'home_providers.dart';

class SearchController extends AsyncNotifier<SearchResults?> {
  @override
  FutureOr<SearchResults?> build() => null;

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      state = const AsyncData(null);
      return;
    }
    state = const AsyncLoading();
    final usecase = SearchAll(ref.read(homeRepositoryProvider));
    final result = await usecase(SearchAllParams(query: query));
    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (data) => AsyncData(data),
    );
  }
}

final searchControllerProvider =
    AsyncNotifierProvider<SearchController, SearchResults?>(SearchController.new);
