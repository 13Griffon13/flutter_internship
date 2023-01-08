import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity_state.freezed.dart';

@freezed
class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState(bool connectionPresent) = _ConnectivityState;
}
