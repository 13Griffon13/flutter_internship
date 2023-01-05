import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_final_recipes/features/recipes_search/domain/entities/recipe_entity.dart';
import 'package:internship_final_recipes/features/save_recipe/data/model/recipe_firestore_model.dart';
import 'package:internship_final_recipes/features/save_recipe/domain/repository/storage_repository.dart';

class FirestoreRepository extends StorageRepository {
  final String _collectionPath = 'savedRecipes';

  @override
  Future init() async {}

  @override
  Future saveRecipe(RecipeEntity recipeEntity) async {
    final newRecipeDoc = FirebaseFirestore.instance
        .collection(_collectionPath)
        .doc('${recipeEntity.label}');
    await newRecipeDoc
        .set(RecipeFirestoreModel.fromEntity(recipeEntity).toJson());
  }

  @override
  Future<List<RecipeEntity>> getSavedRecipes() async {
    final collection =
        await FirebaseFirestore.instance.collection(_collectionPath).get();
    return collection.docs
        .map((e) => RecipeFirestoreModel.fromJson(e.data()).toEntity())
        .toList();
  }
}
