import 'package:flutter/material.dart';
import 'package:internship_final_recipes/features/recipes_search/domain/entities/recipe_entity.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/recipe_detail.dart';
import 'package:internship_final_recipes/util/hero_tags.dart';

class RecipeTile extends StatelessWidget {
  final RecipeEntity recipeEntity;

  const RecipeTile({
    Key? key,
    required this.recipeEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 80.0,
        child: ListTile(
          leading: Hero(
            tag: '${HeroTags.recipeDetail}_${recipeEntity.label}',
            child: Image.network(recipeEntity.image),
          ),
          title: Text(recipeEntity.label),
          trailing: Text(recipeEntity.calories.toString()),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    RecipeDetail(recipeEntity: recipeEntity)));
          },
        ),
      ),
    );
  }
}
