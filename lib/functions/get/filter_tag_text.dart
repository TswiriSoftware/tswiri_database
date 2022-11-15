part of tswiri_database;

List<TagText> filterTagTexts({
  required List<int> excludedTags,
  String? enteredKeyWord,
}) {
  if (enteredKeyWord != null && enteredKeyWord.isNotEmpty) {
    return _isar!.tagTexts
        .filter()
        .textContains(enteredKeyWord, caseSensitive: false)
        .and()
        .not()
        .group((q) =>
            q.anyOf(excludedTags, (q, int tagTextID) => q.idEqualTo(tagTextID)))
        .findAllSync();
  }

  return _isar!.tagTexts
      .filter()
      .not()
      .group((q) =>
          q.anyOf(excludedTags, (q, int tagTextID) => q.idEqualTo(tagTextID)))
      .findAllSync();
}
