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
