import 'package:flutter/material.dart';
import 'package:internship_final_recipes/locale/locale.dart';

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
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, possition) {
          return Container();
        },
      ),
    );
  }
}
