import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:internship_final_recipes/features/about/ui/animated_info.dart';
import 'package:internship_final_recipes/navigation/routes.gr.dart';
import 'package:internship_final_recipes/translations/locale_keys.g.dart';

import '../features/recipes_search/ui/recipes_search_home.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final StreamController<bool> _animationController = StreamController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.translate),
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text('English'),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Русский'),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                context.setLocale(const Locale('en'));
              }
              if (value == 1) {
                context.setLocale(const Locale('ru'));
              }
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(LocaleKeys.menuHistory.tr()),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text(LocaleKeys.menuAbout.tr()),
                ),
              ];
            },
            onSelected: (selectedIndex) {
              if (selectedIndex == 0) {
                context.router.push(const HistoryScreenRoute());
              }
              if (selectedIndex == 1) {
                _animationController.add(true);
              }
            },
          ),
        ],
        title: Text(
          LocaleKeys.title.tr(),
        ),
      ),
      body: Stack(
        children: [
          RecipesSearch(),
          AnimatedInfo(
            animationLauncher: _animationController.stream,
          ),
        ],
      ),
    );
  }
}
