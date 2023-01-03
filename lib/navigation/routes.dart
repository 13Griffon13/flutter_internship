import 'package:auto_route/annotations.dart';
import 'package:internship_final_recipes/core/home_page.dart';
import 'package:internship_final_recipes/features/history/ui/history_screen.dart';
import 'package:internship_final_recipes/features/recipes_search/ui/search_result_presentation/recipe_detail.dart';
import 'package:internship_final_recipes/navigation/paths.dart';

@MaterialAutoRouter(routes: [
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
