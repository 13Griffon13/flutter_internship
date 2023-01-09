import 'package:flutter/material.dart';
import 'package:internship_final_recipes/core/domain/recipe_entity.dart';
import 'package:internship_final_recipes/util/hero_tags.dart';

class RecipeTile extends StatelessWidget {
  final RecipeEntity recipeEntity;
  final bool isSelected;
  final Function()? onTap;
  final Function()? onLongPress;
  final Function(DismissDirection direction)? onDismiss;

  const RecipeTile({
    Key? key,
    required this.recipeEntity,
    required this.isSelected,
    this.onTap,
    this.onLongPress,
    this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(recipeEntity.label),
      direction: DismissDirection.startToEnd,
      onDismissed: onDismiss,
      child: Card(
        margin: isSelected
            ? const EdgeInsets.fromLTRB(
                32.0,
                8.0,
                8.0,
                8.0,
              )
            : const EdgeInsets.all(8.0),
        color: isSelected ? Colors.blue.shade300 : null,
        child: SizedBox(
          height: 80.0,
          child: ListTile(
            contentPadding: const EdgeInsets.all(10.0),
            leading: Hero(
              tag: '${HeroTags.recipeDetail}_${recipeEntity.label}',
              child: SizedBox(
                width: 60,
                height: 60,
                child: Image.network(
                  recipeEntity.image,
                  errorBuilder: (context, exception, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
            ),
            title: Text(
              recipeEntity.label,
              overflow: TextOverflow.fade,
            ),
            trailing: Text(recipeEntity.calories.toStringAsFixed(2)),
            onTap: onTap,
            onLongPress: onLongPress,
          ),
        ),
      ),
    );
  }
}
