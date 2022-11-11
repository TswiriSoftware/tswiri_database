part of tswiri_database;

List<MLObject> getMlObjects({
  int? photoID,
}) {
  if (photoID != null) {
    _isar!.mLObjects.filter().photoIDEqualTo(photoID).findAllSync();
  }
  return _isar!.mLObjects.where().findAllSync();
}
