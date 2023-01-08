import 'package:dartz/dartz.dart';

import '../../../../core/domain/failure.dart';
import '../../../../core/domain/recipe_entity.dart';


abstract class ApiRepository {
  Future<Either<Failure, List<RecipeEntity>>> searchRecipes(String request);
}
