import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/util/sort_types.dart';

import '../../../domain/entities/recipes_list.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.empty() = _SearchStateEmpty;

  const factory SearchState.withData(
    RecipesList recipesList, [
    @Default(SortType.none) SortType sortType,
  ]) = _SearchStateWithData;

  const factory SearchState.loading() = _SearchStateLoading;

  const factory SearchState.error(
    String errorMessage,
  ) = _SearchStateError;
}
