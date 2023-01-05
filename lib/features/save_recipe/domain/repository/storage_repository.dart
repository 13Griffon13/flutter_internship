
import 'dart:async';


import '../../../recipes_search/domain/entities/recipe_entity.dart';

abstract class StorageRepository{

  Future init();
  Future saveRecipe(RecipeEntity recipeEntity);
  Future<List<RecipeEntity>> getSavedRecipes();

}