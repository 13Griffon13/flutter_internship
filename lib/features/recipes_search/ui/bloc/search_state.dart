import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/recipes_list.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.empty() = _SearchStateEmpty;

  const factory SearchState.withData(
    RecipesList recipesList,
  ) = _SearchStateWithData;

  const factory SearchState.loading() = _SearchStateLoading;

  const factory SearchState.error(
    String errorMessage,
  ) = _SearchStateError;
}
