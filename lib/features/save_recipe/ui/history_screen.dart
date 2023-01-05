import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_final_recipes/features/save_recipe/ui/bloc/history_bloc.dart';
import 'package:internship_final_recipes/locale/locale.dart';

import 'bloc/history_state.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleStrings.menuHistory(),
        ),
      ),
      body: BlocBuilder<HistoryBloc,HistoryState>(
        builder: (context,state){
          return ListView.builder(
            itemCount: state.recipes.length,
            itemBuilder: (context, position) {
              return Container();
            },
          );
        },
      ),
    );
  }
}
