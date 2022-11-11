part of tswiri_database;

int? putPhoto({
  required Photo photo,
}) {
  int? id;
  _isar!.writeTxnSync(() {
    id = _isar!.photos.putSync(photo);
  });
  return id;
}
