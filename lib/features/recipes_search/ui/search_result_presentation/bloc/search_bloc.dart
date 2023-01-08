import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/features/recipes_search/domain/entities/search_request.dart';

import '../../../data/repository/edamam_repository.dart';
import '../../../domain/repository/api_repository.dart';
import 'search_events.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiRepository apiRepository = EdamamRepository();
  Timer? timer;

  SearchBloc()
      : super(const SearchState(
          recipesList: [],
          searchRequest: SearchRequest(request: ''),
          searchStage: SearchStage.completed,
        )) {
    on<SearchEvent>((event, emit) async {
      await event.map(
        requestChanged: (requestChanged) async {
          if (requestChanged.request != state.searchRequest.request) {
            emit(state.copyWith(
              searchRequest: SearchRequest(
                request: requestChanged.request,
                wasProcessed: false,
              ),
            ));
            timer?.cancel();
            timer = Timer(const Duration(milliseconds: 500), () {
              if (state.searchRequest.request != '') {
                add(SearchEvent.sendRequest(state.searchRequest.request));
              }
            });
          }
        },
        sendRequest: (sendRequest) async {
          emit(state.copyWith(
            searchStage: SearchStage.loading,
            searchRequest: state.searchRequest.copyWith(wasProcessed: true),
          ));
          final response = await apiRepository.searchRecipes(event.request);
          response.fold(
            (failure) {
              emit(state.copyWith(
                  searchStage: SearchStage.error, error: failure.errorMessage));
            },
            (recipesList) {
              emit(state.copyWith(
                  searchStage: SearchStage.completed,
                  recipesList: recipesList));
            },
          );
        },
      );
    });
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
