import 'dart:convert';

import 'package:tswiri_database/src/collections/collection_names.dart';

import '../../collections/export.dart';

int hashCollection({required Isar isar, required Collections collection}) {
  //Table size.
  String byteSize = isar
      .getCollectionByNameInternal(collection.name)!
      .getSizeSync()
      .toString();

  //Table count.
  int count = isar.getCollectionByNameInternal(collection.name)!.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      isar
          .getCollectionByNameInternal(collection.name)!
          .where()
          .findAllSync()
          .first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (isar
          .getCollectionByNameInternal(collection.name)!
          .where()
          .findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      isar
          .getCollectionByNameInternal(collection.name)!
          .where()
          .findAllSync()
          .last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}
