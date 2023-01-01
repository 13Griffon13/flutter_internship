import 'package:flutter/material.dart';
import 'package:internship_final_recipes/locale/locale.dart';

import '../features/recipes_search/ui/recipes_search_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleStrings.title(),
        ),
      ),
      body: const RecipesSearch(),
    );
  }
}
