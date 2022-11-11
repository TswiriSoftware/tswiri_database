part of tswiri_database;

int? putPhotoLabel({
  required PhotoLabel photoLabel,
}) {
  int? id;
  _isar!.writeTxnSync(() {
    id = _isar!.photoLabels.putSync(photoLabel);
  });
  return id;
}
