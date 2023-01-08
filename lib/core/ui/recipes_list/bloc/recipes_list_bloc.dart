import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/core/ui/recipes_list/sort_types.dart';

import '../../../domain/recipe_entity.dart';
import 'recipes_list_event.dart';
import 'recipes_list_state.dart';

class RecipeListBloc extends Bloc<RecipeListEvent, RecipesListState> {
  RecipeListBloc() : super(const RecipesListState(SortType.none, [], {})) {
    on<RecipeListEvent>((event, emit) {
      event.map(
        setList: (setListEvent) {
          emit(state.copyWith(recipes: _sortList(setListEvent.recipes)));
        },
        setSortType: (setSortTypeEvent) {
          emit(state.copyWith(sortType: setSortTypeEvent.sortType));
          add(RecipeListEvent.setList(state.recipes));
        },
        selectItem: (selectItemEvent) {
          emit(state.copyWith(
              selected: {...state.selected, selectItemEvent.itemIndex}));
        },
        deselectItem: (deselectItemEvent) {
          var set = <int>{...state.selected};
          set.remove(deselectItemEvent.itemIndex);
          emit(state.copyWith(selected: set));
        },
        deselectAll: (deselectAllEvent) {
          emit(state.copyWith(selected: {}));
        },
      );
    });
  }

  List<RecipeEntity> _sortList(List<RecipeEntity> list) {
    var sortedList = <RecipeEntity>[...list];
    switch (state.sortType) {
      case SortType.incremental:
        sortedList.sort((a, b) {
          return a.calories.compareTo(b.calories);
        });
        return sortedList;
      case SortType.decremental:
        sortedList.sort((a, b) {
          return b.calories.compareTo(a.calories);
        });
        return sortedList;
      default:
        return list;
    }
  }
}
