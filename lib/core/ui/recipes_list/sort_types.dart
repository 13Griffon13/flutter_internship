import 'package:internship_final_recipes/translations/locale_keys.g.dart';

enum SortType {
  incremental(LocaleKeys.incrementalSort),
  decremental(LocaleKeys.decrementalSort),
  none(LocaleKeys.noSort);

  const SortType(this.localeKey);
  final String localeKey;
}