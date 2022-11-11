part of tswiri_database;

///default: Returns a list of all [MLTextElement].
///
///photoID: Returns a list of [MLTextElement] matching photoID.
///
List<MLTextElement> getMLTextElements({
  int? photoID,
}) {
  if (photoID != null) {
    return _isar!.mLTextElements.filter().photoIDEqualTo(photoID).findAllSync();
  }
  return _isar!.mLTextElements.where().findAllSync();
}
