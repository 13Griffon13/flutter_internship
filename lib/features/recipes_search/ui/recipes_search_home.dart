import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/core/ui/recipes_list/bloc/recipes_list_bloc.dart';
import 'package:internship_final_recipes/core/ui/recipes_list/bloc/recipes_list_event.dart';
import 'package:internship_final_recipes/features/connectivity_checker/ui/bloc/connectivity_state.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_result_presentation/bloc/search_events.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_result_presentation/bloc/search_state.dart';
import 'package:internship_final_recipes/features/save_recipe/ui/bloc/history_bloc.dart';
import 'package:internship_final_recipes/features/save_recipe/ui/bloc/history_events.dart';
import 'package:internship_final_recipes/translations/locale_keys.g.dart';

import '../../../core/ui/recipes_list/recipes_list.dart';
import '../../connectivity_checker/ui/bloc/connectivity_bloc.dart';
import 'search_result_presentation/bloc/search_bloc.dart';

class RecipesSearch extends StatefulWidget {
  const RecipesSearch({Key? key}) : super(key: key);

  @override
  State<RecipesSearch> createState() => _RecipesSearchState();
}

class _RecipesSearchState extends State<RecipesSearch> {
   late final RecipeListBloc recipeListBloc;

  @override
  void initState() {
    super.initState();
    recipeListBloc = RecipeListBloc();
  }

  @override
  void dispose() {
    recipeListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: LocaleKeys.searchHint.tr(),
          ),
          onChanged: (value) {
            context.read<SearchBloc>().add(SearchEvent.requestChanged(value));
          },
        ),
        //todo revisit this part
        Flexible(
          child: BlocConsumer<SearchBloc, SearchState>(
            bloc: context.read<SearchBloc>(),
            listener: (context, state) {
              recipeListBloc.add(RecipeListEvent.setList(state.recipesList));
            },
            buildWhen: (previous, current) {
              return current.searchRequest.wasProcessed;
            },
            builder: (context, state) {
              switch (state.searchStage) {
                case SearchStage.completed:
                  return RecipeList(
                    recipeListBloc: recipeListBloc,
                  );
                case SearchStage.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case SearchStage.error:
                  return Center(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                        Text(state.error ?? ''),
                      ],
                    ),
                  );
              }
            },
          ),
        ),
        BlocConsumer<ConnectivityBloc, ConnectivityState>(
            bloc: ConnectivityBloc(),
            listenWhen: (previous, current) {
              return current.connectionPresent == false;
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(LocaleKeys.noInternetText.tr())));
            },
            builder: (context, state) {
              return Offstage(
                offstage: !state.connectionPresent,
                child: ElevatedButton(
                  child: Text(
                    LocaleKeys.saveButtonText.tr(),
                  ),
                  onPressed: () {
                    final historyBloc = context.read<HistoryBloc>();
                    for (var index in recipeListBloc.state.selected) {
                      recipeListBloc.add(const RecipeListEvent.deselectAll());
                      historyBloc.add(HistoryEvent.addItem(
                          recipeListBloc.state.recipes[index]));
                    }
                  },
                ),
              );
            }),
      ],
    );
  }
}
