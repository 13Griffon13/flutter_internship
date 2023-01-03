import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_interface/bloc/search_interface_event.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_interface/bloc/search_interface_state.dart';

class SearchInterfaceBloc
    extends Bloc<SearchInterfaceEvent, SearchInterfaceState> {
  Timer? timer;

  SearchInterfaceBloc() : super(const SearchInterfaceState()) {
    on<SearchInterfaceEvent>((event, emit) {
      event.map(
        requestChanged: (event) {
          emit(state.copyWith(
            request: event.newRequest,
            readyToSend: false,
          ));
          timer?.cancel();
          timer = Timer(const Duration(milliseconds: 500), () {
            if (state.request != '') {
              add(const SearchInterfaceEvent.readyToSendRequest());
            }
          });
        },
        sortTypeChanged: (event) {
          emit(state.copyWith(
            sortType: event.newSortType,
            readyToSend: false,
          ));
        },
        readyToSendRequest: (event) {
          emit(state.copyWith(
            readyToSend: true,
          ));
        },
      );
    });
  }
}
