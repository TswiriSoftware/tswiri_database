part of tswiri_database;

///default: null.
///
///id: Returns [TagText] matching id.
MLDetectedLabelText? getMlDetectedLabelText({
  int? id,
  String? text,
}) {
  if (id != null) {
    return _isar!.mLDetectedLabelTexts.getSync(id);
  }

  if (text != null) {
    return _isar!.mLDetectedLabelTexts
        .filter()
        .detectedLabelTextMatches(text.toLowerCase().trim())
        .findFirstSync();
  }

  return null;
}

///Returns a list of [MLDetectedLabelText] where the text contains the enteredKeyword
List<MLDetectedLabelText> getMLDetectedLabelTextsTagContain({
  required String enteredKeyword,
}) {
  return _isar!.mLDetectedLabelTexts
      .filter()
      .detectedLabelTextContains(enteredKeyword, caseSensitive: false)
      .findAllSync();
}

///Returns all [MLDetectedLabelText] matching on the list of mlDetectedLabelTextIDs.
List<MLDetectedLabelText> getMlDetectedLabelTextsOnMlDetectedLabelTextIDs({
  required Set<int> mlDetectedLabelTextIDs,
}) {
  return _isar!.mLDetectedLabelTexts
      .filter()
      .anyOf(mlDetectedLabelTextIDs, (q, int element) => q.idEqualTo(element))
      .findAllSync();
}
