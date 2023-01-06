import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/ui/recipes_list/bloc/recipes_list_bloc.dart';
import '../../../core/ui/recipes_list/bloc/recipes_list_event.dart';
import '../../../core/ui/recipes_list/recipes_list.dart';
import '../../../locale/locale.dart';
import 'bloc/history_bloc.dart';
import 'bloc/history_state.dart';

class HistoryScreen extends StatelessWidget{
  HistoryScreen({Key? key}) : super(key: key);
  final RecipeListBloc _recipeListBloc = RecipeListBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleStrings.menuHistory(),
        ),
      ),
      body: BlocListener<HistoryBloc, HistoryState>(
        bloc: context.read<HistoryBloc>(),
        listener: (context, state) {
          //todo fix this issue
          _recipeListBloc.add(RecipeListEvent.setList(state.recipes));
        },
        child: RecipeList(
          recipeListBloc: _recipeListBloc,
        ),
      ),
    );
  }
}
