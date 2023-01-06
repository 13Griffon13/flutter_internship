import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/core/ui/recipes_list/bloc/recipes_list_bloc.dart';
import 'package:internship_final_recipes/core/ui/recipes_list/bloc/recipes_list_event.dart';
import 'package:internship_final_recipes/core/ui/recipes_list/bloc/recipes_list_state.dart';
import 'package:internship_final_recipes/core/ui/recipes_list/recipe_tile.dart';
import 'package:internship_final_recipes/core/ui/recipes_list/sort_types.dart';
import 'package:internship_final_recipes/locale/locale.dart';

import '../../../navigation/routes.gr.dart';

class RecipeList extends StatelessWidget {
  final Widget? header;
  final RecipeListBloc recipeListBloc;

  const RecipeList({
    Key? key,
    this.header,
    required this.recipeListBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeListBloc, RecipesListState>(
        bloc: recipeListBloc,
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(child: header ?? Container()),
                  DropdownButton<SortType>(
                    value: state.sortType,
                    items: SortType.values
                        .map((e) => DropdownMenuItem<SortType>(
                              value: e,
                              child: Text(e.name),
                            ))
                        .toList(),
                    onChanged: (value) {
                      recipeListBloc.add(
                          RecipeListEvent.setSortType(value ?? SortType.none));
                    },
                  ),
                ],
              ),
              Flexible(
                child: state.recipes.isNotEmpty
                    ? ListView.builder(
                        itemCount: state.recipes.length,
                        itemBuilder: (context, position) {
                          return RecipeTile(
                            recipeEntity: state.recipes[position],
                            isSelected: state.selected.contains(position),
                            onTap: () {
                              context.router.push(RecipeDetailRoute(
                                  recipeEntity: state.recipes[position]));
                            },
                            onLongPress: () {
                              if (state.selected.contains(position)) {
                                recipeListBloc.add(
                                    RecipeListEvent.deselectItem(position));
                              } else {
                                recipeListBloc
                                    .add(RecipeListEvent.selectItem(position));
                              }
                            },
                          );
                        },
                      )
                    : Center(
                        child: Text(LocaleStrings.emptySearch()),
                      ),
              ),
            ],
          );
        });
  }
}
