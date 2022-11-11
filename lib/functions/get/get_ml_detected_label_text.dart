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
