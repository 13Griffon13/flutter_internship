import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/features/recipes_search/domain/entities/recipes_list.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/bloc/search_bloc.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/bloc/search_events.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/recipe_tile.dart';

class SearchBody extends StatelessWidget {
  final RecipesList? recipesList;

  const SearchBody({Key? key, this.recipesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        //todo rework search bloc add helper bloc to manage search input
        TextField(
          onSubmitted: (text) {
            context.read<SearchBloc>().add(RequestSent(text));
          },
        ),
        Flexible(
          child: recipesList != null
              ? ListView.builder(
                  itemCount: recipesList!.recipes.length,
                  itemBuilder: (context, position) {
                    return RecipeTile(
                        recipeEntity: recipesList!.recipes[position]);
                  },
                )
              : Container(),
        ),
      ],
    );
  }
}
