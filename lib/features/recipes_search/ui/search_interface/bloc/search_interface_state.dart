import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/ui/recipes_list/sort_types.dart';

part 'search_interface_state.freezed.dart';

@freezed
class SearchInterfaceState with _$SearchInterfaceState {
  const factory SearchInterfaceState([
    @Default('') String request,
    @Default(SortType.none) SortType sortType,
    @Default(false) bool readyToSend,
  ]) = _SearchInterfaceState;
}

