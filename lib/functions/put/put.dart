// ignore_for_file: invalid_use_of_protected_member

part of tswiri_database;

int? isarPut({
  required Collections collection,
  required dynamic object,
}) {
  int? id;
  _isar!.writeTxnSync(() {
    id = _isar!.getCollectionByNameInternal(collection.name)!.putSync(object);

    ///Write to changes.
  });
  return id;
}

List<int> isarPutAll({
  required Collections collection,
  required List<dynamic> objects,
}) {
  List<int> ids = [];
  _isar!.writeTxnSync(() {
    ids = _isar!
        .getCollectionByNameInternal(collection.name)!
        .putAllSync(objects);
  });

  return ids;
}
