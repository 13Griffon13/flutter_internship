
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internship_final_recipes/core/ui/recipes_list/sort_types.dart';

import '../../../domain/recipe_entity.dart';

part 'recipes_list_state.freezed.dart';

@freezed
class RecipesListState with _$RecipesListState{

  const factory RecipesListState(
      SortType sortType,
      List<RecipeEntity> recipes,
      Set<int> selected,
      ) = _RecipesListState;
}