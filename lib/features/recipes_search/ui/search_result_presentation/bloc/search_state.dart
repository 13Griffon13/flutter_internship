import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internship_final_recipes/features/recipes_search/domain/entities/search_request.dart';

import '../../../../../core/domain/recipe_entity.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<RecipeEntity> recipesList,
    required SearchRequest searchRequest,
    required SearchStage searchStage,
    String? error,
  }) = _SearchState;
}

enum SearchStage {
  completed,
  loading,
  error,
}
