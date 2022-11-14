part of tswiri_database;

///default: Returns a list of all [PhotoLabel].
///
///photoID: Returns a list of [PhotoLabel] matching photoID.
///
List<PhotoLabel> getPhotoLabels({
  int? photoID,
  int? tagTextID,
}) {
  if (photoID != null) {
    return _isar!.photoLabels.filter().photoIDEqualTo(photoID).findAllSync();
  }
  if (tagTextID != null) {
    return _isar!.photoLabels
        .filter()
        .tagTextIDEqualTo(tagTextID)
        .findAllSync();
  }
  return _isar!.photoLabels.where().findAllSync();
}
