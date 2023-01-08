import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/translations/locale_keys.g.dart';


import '../../../core/ui/recipes_list/bloc/recipes_list_bloc.dart';
import '../../../core/ui/recipes_list/bloc/recipes_list_event.dart';
import '../../../core/ui/recipes_list/recipes_list.dart';
import 'bloc/history_bloc.dart';
import 'bloc/history_state.dart';

class HistoryScreen extends StatefulWidget{
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late final RecipeListBloc _recipeListBloc;

  @override
  void initState() {
    _recipeListBloc = RecipeListBloc()
    ..add(RecipeListEvent.setList(context.read<HistoryBloc>().state.recipes));
    super.initState();
  }

  @override
  void dispose() {
    _recipeListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.menuHistory.tr(),
        ),
      ),
      body: BlocListener<HistoryBloc, HistoryState>(
        bloc: context.read<HistoryBloc>(),
        listener: (context, state) {
          _recipeListBloc.add(RecipeListEvent.setList(state.recipes));
        },
        child: RecipeList(
          recipeListBloc: _recipeListBloc,
        ),
      ),
    );
  }
}
