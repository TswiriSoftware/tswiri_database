// ignore_for_file: invalid_use_of_protected_member

import 'package:isar/isar.dart';
import 'package:tswiri_database/src/collections/collection_names.dart';

int? isarPut({
  required Isar isar,
  required Collections collection,
  required dynamic object,
}) {
  int? id;
  isar.writeTxnSync(() {
    id = isar.getCollectionByNameInternal(collection.name)!.putSync(object);

    ///Write to changes.
  });
  return id;
}

List<int> isarPutAll({
  required Isar isar,
  required Collections collection,
  required List<dynamic> objects,
}) {
  List<int> ids = [];
  isar.writeTxnSync(() {
    ids =
        isar.getCollectionByNameInternal(collection.name)!.putAllSync(objects);
  });

  return ids;
}
