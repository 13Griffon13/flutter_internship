import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_entity.freezed.dart';

@freezed
class RecipeEntity with _$RecipeEntity {
  factory RecipeEntity(
    String label,
    String image,
    double calories,
    List<String> ingredientLines,
  ) = _RecipeEntity;
}
