import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internship_final_recipes/core/domain/recipe_entity.dart';

part 'recipe_firestore_model.freezed.dart';

part 'recipe_firestore_model.g.dart';

@freezed
class RecipeFirestoreModel with _$RecipeFirestoreModel {
  const factory RecipeFirestoreModel(
    String uri,
    String label,
    String image,
    double calories,
    List<String> ingredientLines,
  ) = _RecipeFirestoreModel;

  factory RecipeFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeFirestoreModelFromJson(json);

  factory RecipeFirestoreModel.fromEntity(RecipeEntity entity) =>
      RecipeFirestoreModel(
        entity.uri,
        entity.label,
        entity.image,
        entity.calories,
        entity.ingredientLines,
      );
}

extension ToEntity on RecipeFirestoreModel {
  RecipeEntity toEntity() {
    return RecipeEntity(uri, label, image, calories, ingredientLines);
  }
}
