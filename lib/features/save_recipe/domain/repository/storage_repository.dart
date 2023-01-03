
import 'dart:async';


import '../../../recipes_search/domain/entities/recipe_entity.dart';
import '../../../recipes_search/domain/entities/recipes_list.dart';

abstract class StorageRepository{

  Future init();
  Future saveRecipe(RecipeEntity recipeEntity);
  Future<RecipesList> getSavedRecipes();

}