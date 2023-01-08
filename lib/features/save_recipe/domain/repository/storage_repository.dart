
import 'dart:async';


import '../../../../core/domain/recipe_entity.dart';

abstract class StorageRepository{

  Future init();
  Future saveRecipe(RecipeEntity recipeEntity);
  Stream<List<RecipeEntity>> updateStream();

}