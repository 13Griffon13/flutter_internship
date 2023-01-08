import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_request.freezed.dart';

@freezed
class SearchRequest with _$SearchRequest {
  const factory SearchRequest({
    required String request,
    @Default(false) bool wasProcessed,
  }) = _SearchRequest;
}
