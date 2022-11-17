// ignore_for_file: invalid_use_of_protected_member

import 'package:isar/isar.dart';
import 'package:tswiri_database/src/collections/collection_names.dart';

isarDelete({
  required Isar isar,
  required Collections collection,
  required int id,
}) {
  isar.writeTxnSync(() {
    isar.getCollectionByNameInternal(collection.name)!.deleteSync(id);
  });
}

isarDeleteAll({
  required Isar isar,
  required Collections collection,
  required List<int> ids,
}) {
  isar.writeTxnSync(() {
    isar.getCollectionByNameInternal(collection.name)!.deleteAllSync(ids);
  });
}
