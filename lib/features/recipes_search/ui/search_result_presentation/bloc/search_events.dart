import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_events.freezed.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.searchRequestSent(String request) =
      _SearchRequestSent;
}
