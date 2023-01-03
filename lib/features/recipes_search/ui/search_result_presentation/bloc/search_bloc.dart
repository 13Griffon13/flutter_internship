import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/features/recipes_search/domain/entities/recipes_list.dart';

import '../../../data/repository/edamam_repository.dart';
import '../../../domain/repository/api_repository.dart';
import '../../util/sort_types.dart';
import 'search_events.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiRepository apiRepository = EdamamRepository();

  SearchBloc() : super(const SearchState.empty()) {
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
              //todo add auto sort after search
              emit(SearchState.withData(recipesList));
            },
          );
        },
        sortMethodChanged: (event) {
          state.mapOrNull(withData: (state) {
            emit(
              state.copyWith(
                  recipesList: _sortRecipes(event.sortType, state.recipesList),
                  sortType: event.sortType),
            );
          });
        },
      );
    });
  }

  RecipesList _sortRecipes(SortType sortType, RecipesList recipesList) {
    var list = recipesList.recipes;
    switch (sortType) {
      case SortType.incremental:
        list.sort((a, b) {
          return a.calories.compareTo(b.calories);
        });
        break;
      case SortType.decremental:
        list.sort((a, b) {
          return b.calories.compareTo(a.calories);
        });
        break;
      case SortType.none:
        break;
    }
    return RecipesList(list);
  }
}
