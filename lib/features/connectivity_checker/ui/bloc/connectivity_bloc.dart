import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/features/connectivity_checker/ui/bloc/connectivity_event.dart';
import 'package:internship_final_recipes/features/connectivity_checker/ui/bloc/connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  late StreamSubscription connectivitySubscription;

  ConnectivityBloc() : super(const ConnectivityState(false)) {
    on<ConnectivityEvent>((event, emit) {
      event.map(
        update: (update) {
          if (state.connectionPresent != update.coonectionPresent) {
            emit(state.copyWith(connectionPresent: update.coonectionPresent));
          }
        },
      );
    });

    connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        add(const ConnectivityEvent.update(false));
      } else {
        add(const ConnectivityEvent.update(true));
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription.cancel();
    return super.close();
  }
}
