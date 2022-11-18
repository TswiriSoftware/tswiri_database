import 'package:tswiri_database/src/collections/export.dart';

List<TagText> filterTagTexts({
  required Isar isar,
  required List<int> excludedTags,
  String? enteredKeyWord,
}) {
  if (enteredKeyWord != null && enteredKeyWord.isNotEmpty) {
    return isar.tagTexts
        .filter()
        .textContains(enteredKeyWord, caseSensitive: false)
        .and()
        .not()
        .group((q) =>
            q.anyOf(excludedTags, (q, int tagTextID) => q.idEqualTo(tagTextID)))
        .findAllSync();
  }

  return isar.tagTexts
      .filter()
      .not()
      .group((q) =>
          q.anyOf(excludedTags, (q, int tagTextID) => q.idEqualTo(tagTextID)))
      .findAllSync();
}
