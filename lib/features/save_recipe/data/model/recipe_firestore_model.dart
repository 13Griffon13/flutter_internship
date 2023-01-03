import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internship_final_recipes/features/recipes_search/domain/entities/recipe_entity.dart';

part 'recipe_firestore_model.freezed.dart';

part 'recipe_firestore_model.g.dart';

@freezed
class RecipeFirestoreModel with _$RecipeFirestoreModel {
  const factory RecipeFirestoreModel(
    String label,
    String image,
    double calories,
    List<String> ingredientLines,
  ) = _RecipeFirestoreModel;

  factory RecipeFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeFirestoreModelFromJson(json);

  factory RecipeFirestoreModel.fromEntity(RecipeEntity entity) =>
      RecipeFirestoreModel(
        entity.label,
        entity.image,
        entity.calories,
        entity.ingredientLines,
      );

}

extension ToEntity on RecipeFirestoreModel{


  RecipeEntity toEntity() {
    return RecipeEntity(label, image, calories, ingredientLines);
  }
}