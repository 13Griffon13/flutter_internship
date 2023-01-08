import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:internship_final_recipes/features/recipes_search/domain/entities/recipe_entity.dart';
import 'package:internship_final_recipes/features/save_recipe/data/model/recipe_firestore_model.dart';
import 'package:internship_final_recipes/features/save_recipe/domain/repository/storage_repository.dart';

class FirestoreRepository extends StorageRepository {
  final String _collectionPath = 'savedRecipes';
  final String _storageReferencePath = 'images';

  @override
  Future init() async {}

  @override
  Future saveRecipe(RecipeEntity recipeEntity) async {
    final newRecipeDoc = FirebaseFirestore.instance
        .collection(_collectionPath)
        .doc(recipeEntity.label);
    final newImageUrl =
        await _saveImageToStorage(recipeEntity.image, recipeEntity.label);
    final updatedEntity = recipeEntity.copyWith(image: newImageUrl);
    await newRecipeDoc
        .set(RecipeFirestoreModel.fromEntity(updatedEntity).toJson());
  }

  @override
  Stream<List<RecipeEntity>> updateStream() {
    final collection = FirebaseFirestore.instance.collection(_collectionPath);
    return collection.snapshots().map((event) => event.docs
        .map((e) => RecipeFirestoreModel.fromJson(e.data()).toEntity())
        .toList());
  }

  Future<String> _saveImageToStorage(String imageUrl, String label) async {
    final url = Uri.parse(imageUrl);
    final response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final storageRef = FirebaseStorage.instance
          .ref(_storageReferencePath)
          .child('${label}.jpg');
      await storageRef.putData(response.bodyBytes);
      final storageUrl = await storageRef.getDownloadURL();
      return storageUrl;
    } else {
      throw Exception('Failed to save image');
    }
  }
}
