import 'package:flutter/material.dart';
import 'package:internship_final_recipes/core/domain/recipe_entity.dart';

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
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.transparent,
            expandedHeight: 320.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
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
                _formatIngredient(recipeEntity.ingredientLines),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatIngredient(List<String> ingredientLines) {
    var result = '';
    for (var ingredient in ingredientLines) {
      result += '$ingredient\n';
    }
    return result;
  }
}
