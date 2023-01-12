// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ru = {
  "title": "Рецепты",
  "searchHint": "Поиск",
  "emptySearch": "Ничего не найдено",
  "menuHistory": "История",
  "menuAbout": "О приложении",
  "saveButtonText": "Сохранить",
  "noInternetText": "Остутсвует подключение",
  "incrementalSort": "По возрастанию",
  "decrementalSort": "По убыванию",
  "noSort": "Сортировка отсутсвует",
  "about": "О приложении:",
  "versionCode": "Код версии:{code}",
  "versionName": "Название версии:{name}"
};
static const Map<String,dynamic> en = {
  "title": "Recipes",
  "searchHint": "Search",
  "emptySearch": "Nothing here",
  "menuHistory": "History",
  "menuAbout": "About app",
  "saveButtonText": "Save",
  "noInternetText": "No internet connection",
  "incrementalSort": "Incremental",
  "decrementalSort": "Decremental",
  "noSort": "No sort",
  "about": "App Info:",
  "versionCode": "Version code:{code}",
  "versionName": "Version name:{name}"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "en": en};
}
