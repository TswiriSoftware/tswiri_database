part of tswiri_database;

///Returns a specific tag text. (sync)
MLDetectedElementText? getMlDetectedElementTextSync({
  int? id,
  String? text,
}) {
  if (id != null) {
    return _isar!.mLDetectedElementTexts.getSync(id);
  }
  if (text != null) {
    return _isar!.mLDetectedElementTexts
        .filter()
        .detectedTextMatches(text)
        .findFirstSync();
  }

  return null;
}

///Returns a list of [MLDetectedElementText] where the text contains the enteredKeyword
List<MLDetectedElementText> getMLDetectedElementTextsThatContain({
  required String enteredKeyword,
}) {
  return _isar!.mLDetectedElementTexts
      .filter()
      .detectedTextContains(enteredKeyword, caseSensitive: false)
      .findAllSync();
}

///Returns all [MLDetectedElementText] matching on the list of mLDetectedElementTextIDs.
List<MLDetectedElementText> getAllMlDetectedLElementTexts({
  required Set<int> mLDetectedElementTextIDs,
}) {
  return _isar!.mLDetectedElementTexts
      .filter()
      .anyOf(mLDetectedElementTextIDs, (q, int element) => q.idEqualTo(element))
      .findAllSync();
}
