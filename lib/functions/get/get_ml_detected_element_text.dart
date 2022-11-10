part of tswiri_database;

///Returns a specific tag text. (sync)
MLDetectedElementText? getMlDetectedElementTextSync({
  int? id,
}) {
  if (id != null) {
    return _isar!.mLDetectedElementTexts.getSync(id);
  }

  return null;
}
