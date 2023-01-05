import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/features/save_recipe/data/repository/firestore_repository.dart';
import 'package:internship_final_recipes/features/save_recipe/domain/repository/storage_repository.dart';

import 'history_events.dart';
import 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final StorageRepository storageRepository = FirestoreRepository();

  HistoryBloc() : super(const HistoryState([])) {
    on<HistoryEvent>((event, emit) async {
      await event.map(
        addItem: ((event) async {
          await storageRepository.saveRecipe(event.recipeEntity);
          add(const HistoryEvent.updaeState());
        }),
        updaeState: (event) async {
          final newList = await storageRepository.getSavedRecipes();
          emit(state.copyWith(recipes: newList));
        },
      );
    });
    add(const HistoryEvent.updaeState());
  }
}
