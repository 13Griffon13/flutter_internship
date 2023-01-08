
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internship_final_recipes/core/ui/recipes_list/sort_types.dart';

import '../../../domain/recipe_entity.dart';

part 'recipes_list_event.freezed.dart';

@freezed
class RecipeListEvent with _$RecipeListEvent{
  const factory RecipeListEvent.setList(List<RecipeEntity> recipes) = _SetList;
  const factory RecipeListEvent.setSortType(SortType sortType) = _SetSortType;
  const factory RecipeListEvent.selectItem(int itemIndex) = _SelectItem;
  const factory RecipeListEvent.deselectItem(int itemIndex) = _DeselectItem;
  const factory RecipeListEvent.deselectAll() = _DeselectAll;
}