import 'package:flutter/material.dart';
import 'package:internship_final_recipes/features/recipes_search/domain/entities/recipe_entity.dart';

import '../../../util/hero_tags.dart';

class RecipeDetail extends StatelessWidget {
  final RecipeEntity recipeEntity;

  const RecipeDetail({
    Key? key,
    required this.recipeEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 280.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Hero(
              tag: '${HeroTags.recipeDetail}_${recipeEntity.label}',
              child: Image.network(recipeEntity.image),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              recipeEntity.ingredientLines.toString(),
            ),
          ),
        ),
      ],
    ));
  }
}
