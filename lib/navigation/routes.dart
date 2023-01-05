import 'package:auto_route/annotations.dart';
import 'package:internship_final_recipes/core/home_page.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_result_presentation/recipe_detail.dart';
import 'package:internship_final_recipes/navigation/paths.dart';

import '../core/logo_splash.dart';
import '../features/save_recipe/ui/history_screen.dart';

@MaterialAutoRouter(routes: [
  AdaptiveRoute(
    initial: true,
    path: RoutePaths.splash,
    page: AnimatedLogoSplash,
  ),
  AdaptiveRoute(
    path: RoutePaths.home,
    page: HomePage,
  ),
  AdaptiveRoute(
    path: RoutePaths.details,
    page: RecipeDetail,
  ),
  AdaptiveRoute(
    path: RoutePaths.history,
    page: HistoryScreen,
  ),
])
class $AppRouter {}
