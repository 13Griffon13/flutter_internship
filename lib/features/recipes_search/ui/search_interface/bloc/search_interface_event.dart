import 'package:freezed_annotation/freezed_annotation.dart';

import '../../util/sort_types.dart';

part 'search_interface_event.freezed.dart';

@freezed
class SearchInterfaceEvent with _$SearchInterfaceEvent {
  const factory SearchInterfaceEvent.requestChanged(String newRequest) =
      _RequestChanged;

  const factory SearchInterfaceEvent.sortTypeChanged(SortType newSortType) =
      _SortTypeChanged;

  const factory SearchInterfaceEvent.readyToSendRequest() =
  _ReadyToSendRequest;
}
