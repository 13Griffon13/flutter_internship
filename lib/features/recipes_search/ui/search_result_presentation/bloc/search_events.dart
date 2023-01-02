import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/util/sort_types.dart';

part 'search_events.freezed.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.searchRequestSent(String request) =
      _SearchRequestSent;

  const factory SearchEvent.sortMethodChanged(SortType sortType) =
  _SortMethodChanged;
}
