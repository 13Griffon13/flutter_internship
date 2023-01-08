

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internship_final_recipes/features/recipes_search/domain/entities/recipe_entity.dart';

part 'history_events.freezed.dart';

@freezed
class HistoryEvent with _$HistoryEvent{

  const factory HistoryEvent.addItem(RecipeEntity recipeEntity) = _AddItem;
  const factory HistoryEvent.updateState(List<RecipeEntity> recipes) = _UpdateState;

}