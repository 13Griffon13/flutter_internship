import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/recipe_entity.dart';

part 'history_state.freezed.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState(
    List<RecipeEntity> recipes,
  ) = _HistoryState;
}
