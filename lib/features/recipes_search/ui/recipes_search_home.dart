import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_interface/search_interface.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_result_presentation/bloc/search_events.dart';

import 'package:internship_final_recipes/features/recipes_search/ui/search_result_presentation/search_body.dart';

import 'search_result_presentation/bloc/search_bloc.dart';
import 'search_result_presentation/bloc/search_state.dart';

class RecipesSearch extends StatelessWidget {
  const RecipesSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SearchInterface(
          onRequestSent: (request) {
            context
                .read<SearchBloc>()
                .add(SearchEvent.searchRequestSent(request));
          },
          onSortTypeChanged: (sortType) {
            context
                .read<SearchBloc>()
                .add(SearchEvent.sortMethodChanged(sortType));
          },
        ),
        Flexible(
          child: BlocBuilder<SearchBloc, SearchState>(
            bloc: context.read<SearchBloc>(),
            builder: (context, state) {
              return state.map(
                empty: (state) {
                  return const SearchBody(
                    recipesList: null,
                  );
                },
                withData: (state) {
                  return SearchBody(recipesList: state.recipesList);
                },
                loading: (state) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                error: (state) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
