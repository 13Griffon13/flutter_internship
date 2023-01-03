import 'package:flutter/material.dart';
import 'package:internship_final_recipes/features/recipes_search/domain/entities/recipes_list.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_result_presentation/recipe_tile.dart';
import 'package:internship_final_recipes/locale/locale.dart';

class SearchBody extends StatelessWidget {
  final RecipesList? recipesList;

  const SearchBody({Key? key, this.recipesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return recipesList != null
        ? ListView.builder(
            itemCount: recipesList!.recipes.length,
            itemBuilder: (context, position) {
              return RecipeTile(recipeEntity: recipesList!.recipes[position]);
            },
          )
        : Center(
            child: Text(
              LocaleStrings.emptySearch(),
            ),
          );
  }
}
