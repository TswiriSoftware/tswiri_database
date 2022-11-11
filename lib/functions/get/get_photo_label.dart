part of tswiri_database;

///default: Returns a list of all [PhotoLabel].
///
///photoID: Returns a list of [PhotoLabel] matching photoID.
///
List<PhotoLabel> getPhotoLabels({
  int? photoID,
}) {
  if (photoID != null) {
    return _isar!.photoLabels.filter().photoIDEqualTo(photoID).findAllSync();
  }
  return _isar!.photoLabels.where().findAllSync();
}
