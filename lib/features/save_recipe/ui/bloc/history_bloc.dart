import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/features/save_recipe/data/repository/firestore_repository.dart';
import 'package:internship_final_recipes/features/save_recipe/domain/repository/storage_repository.dart';

import 'history_events.dart';
import 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final StorageRepository storageRepository = FirestoreRepository();
  late StreamSubscription updateSubscription;

  HistoryBloc() : super(const HistoryState([])) {
    on<HistoryEvent>((event, emit) async {
      await event.map(addItem: ((event) async {
        await storageRepository.saveRecipe(event.recipeEntity);
      }), updateState: (event) async {
        emit(state.copyWith(recipes: event.recipes));
      }, deleteItem: (deleteItem) async {
        await storageRepository.deleteRecipe(deleteItem.recipeEntity);
      });
    });
    updateSubscription = storageRepository.updateStream().listen((event) {
      add(HistoryEvent.updateState(event));
    });
  }

  @override
  Future<void> close() {
    updateSubscription.cancel();
    return super.close();
  }
}
