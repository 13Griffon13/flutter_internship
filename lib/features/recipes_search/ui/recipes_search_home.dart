import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/bloc/search_bloc.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/bloc/search_state.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_body.dart';

class RecipesSearch extends StatelessWidget {
  const RecipesSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: context.read<SearchBloc>(),
      builder: (context, state) {
        print('!!!!!!!!!!!!!!REBIULD!!!!!!!!!!!!!!!!');
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
    );
  }
}
