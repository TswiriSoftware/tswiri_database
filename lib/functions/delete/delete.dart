// ignore_for_file: invalid_use_of_protected_member

part of tswiri_database;

isarDelete({
  required Collections collection,
  required int id,
}) {
  _isar!.writeTxnSync(() {
    _isar!.getCollectionByNameInternal(collection.name)!.deleteSync(id);
  });
}

isarDeleteAll({
  required Collections collection,
  required List<int> ids,
}) {
  _isar!.writeTxnSync(() {
    _isar!.getCollectionByNameInternal(collection.name)!.deleteAllSync(ids);
  });
}
