import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_events.freezed.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.requestChanged(String request) =
  _RequestChanged;
  const factory SearchEvent.sendRequest(String request) =
  _SendRequest;
}
