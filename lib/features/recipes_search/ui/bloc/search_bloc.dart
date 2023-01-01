import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/edamam_repository.dart';
import '../../domain/repository/api_repository.dart';
import 'search_events.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiRepository apiRepository = EdamamRepository();

  SearchBloc() : super(const SearchState.empty()) {
    on<RequestSent>((event, emit) async {
      emit(const SearchState.loading());
      final response = await apiRepository.searchRecipes(event.request);
      response.fold(
        (failure) {
          emit(SearchState.error(failure.errorMessage));
        },
        (recipesList) {
          print(recipesList.toString());
          emit(SearchState.withData(recipesList));
        },
      );
    });
  }
}
