import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/features/recipes_search/domain/entities/recipes_list.dart';

import '../../../data/repository/edamam_repository.dart';
import '../../../domain/repository/api_repository.dart';
import 'search_events.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiRepository apiRepository = EdamamRepository();

  SearchBloc() : super(SearchState.withData(RecipesList([]))) {
    on<SearchEvent>((event, emit) async {
      await event.map(
        searchRequestSent: (event) async {
          emit(const SearchState.loading());
          final response = await apiRepository.searchRecipes(event.request);
          response.fold(
            (failure) {
              emit(SearchState.error(failure.errorMessage));
            },
            (recipesList) {
              emit(SearchState.withData(recipesList));
            },
          );
        },
      );
    });
  }
}