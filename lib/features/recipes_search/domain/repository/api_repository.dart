import 'package:dartz/dartz.dart';

import '../entities/failure.dart';
import '../entities/recipes_list.dart';


abstract class ApiRepository {
  Future<Either<Failure, RecipesList>> searchRecipes(String request);
}
