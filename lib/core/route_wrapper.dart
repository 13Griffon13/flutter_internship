
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/recipes_search/ui/search_result_presentation/bloc/search_bloc.dart';
import '../features/save_recipe/ui/bloc/history_bloc.dart';

class RoutesWrapper extends StatelessWidget implements AutoRouteWrapper{
  const RoutesWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HistoryBloc(),
        ),
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
      ],
      child: this,
    );
  }
}
