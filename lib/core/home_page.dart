import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:internship_final_recipes/locale/locale.dart';
import 'package:internship_final_recipes/navigation/routes.gr.dart';

import '../features/recipes_search/ui/recipes_search_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(LocaleStrings.menuHistory()),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text(LocaleStrings.menuAbout()),
                ),
              ];
            },
            onSelected: (selectedIndex){
              if(selectedIndex == 0){
                context.router.push(const HistoryScreenRoute());
              }
              if(selectedIndex == 1){
                print('About Nothing here for now');
              }
            },
          ),
        ],
        title: Text(
          LocaleStrings.title(),
        ),
      ),
      body: const RecipesSearch(),
    );
  }
}
