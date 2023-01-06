import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/core/ui/recipes_list/bloc/recipes_list_bloc.dart';
import 'package:internship_final_recipes/core/ui/recipes_list/bloc/recipes_list_event.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_result_presentation/bloc/search_state.dart';
import 'package:internship_final_recipes/features/save_recipe/ui/bloc/history_bloc.dart';
import 'package:internship_final_recipes/features/save_recipe/ui/bloc/history_events.dart';

import '../../../core/ui/recipes_list/recipes_list.dart';
import '../../../locale/locale.dart';
import 'search_interface/search_interface.dart';
import 'search_result_presentation/bloc/search_bloc.dart';
import 'search_result_presentation/bloc/search_events.dart';

class RecipesSearch extends StatelessWidget {
  RecipesSearch({Key? key}) : super(key: key);
  final RecipeListBloc recipeListBloc = RecipeListBloc();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SearchInterface(
          onRequestSent: (request) {
            context
                .read<SearchBloc>()
                .add(SearchEvent.searchRequestSent(request));
          },
        ),
        //todo revisit this part
        Flexible(
          child: BlocConsumer<SearchBloc, SearchState>(
            bloc: context.read<SearchBloc>(),
            listener: (context, state) {
              state.mapOrNull(withData: (state) {
                recipeListBloc
                    .add(RecipeListEvent.setList(state.recipesList.recipes));
              });
            },
            builder: (context, state) {
              return state.map(withData: (stateWithData) {
                return RecipeList(
                  recipeListBloc: recipeListBloc,
                );
              }, loading: (loadingState) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }, error: (errorState) {
                return Expanded(
                  child: Center(
                    child: Text(errorState.errorMessage),
                  ),
                );
              });
            },
          ),
        ),
        Offstage(
          offstage: false,
          child: ElevatedButton(
            child: Text(
              LocaleStrings.saveButtonText(),
            ),
            onPressed: () {
              final historyBloc = context.read<HistoryBloc>();
              for (var index in recipeListBloc.state.selected) {
                historyBloc.add(
                    HistoryEvent.addItem(recipeListBloc.state.recipes[index]));
              }
            },
          ),
        ),
      ],
    );
  }
}
