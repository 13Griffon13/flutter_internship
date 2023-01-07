import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:internship_final_recipes/util/api_keys.dart';

import '../../domain/entities/failure.dart';
import '../../domain/entities/recipes_list.dart';
import '../../domain/repository/api_repository.dart';
import '../models/response_model.dart';

class EdamamRepository extends ApiRepository {
  final String _baseUrl = 'api.edamam.com';

  @override
  Future<Either<Failure, RecipesList>> searchRecipes(String request) async {
    final url = Uri.https(
      _baseUrl,
      '/search',
      {
        'q': request,
        'app_id': ApiKeys.appID,
        'app_key': ApiKeys.appKey,
      },
    );
    final response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
        print(decodedJson.toString());
        final parsedModel = Response.fromJson(decodedJson);
        return Right(RecipesList(
          parsedModel.hits!.map((e) => e.recipe!.toEntity()).toList(),
        ));
       } catch (e) {
        print(e.toString());
        return Left(Failure(
          'Parsing error',
          null,
        ));
      }
    } else {
      return Left(Failure(
        response.reasonPhrase ?? 'Unknown error',
        response.statusCode,
      ));
    }
  }
}
