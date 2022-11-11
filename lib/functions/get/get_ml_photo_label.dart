part of tswiri_database;

///default: Returns a list of all [MLPhotoLabel].
///
///photoID: Returns a list of [MLPhotoLabel] matching photoID.
///
List<MLPhotoLabel> getMLPhotoLabels({
  int? photoID,
}) {
  if (photoID != null) {
    return _isar!.mLPhotoLabels.filter().photoIDEqualTo(photoID).findAllSync();
  }
  return _isar!.mLPhotoLabels.where().findAllSync();
}
