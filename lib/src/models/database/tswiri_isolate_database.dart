import 'dart:io';

import 'package:isar/isar.dart';
import 'package:tswiri_database/src/models/database/tswiri_database_object.dart';

class TswiriIsolateDatabase extends TswiriDatabaseObject {
  TswiriIsolateDatabase({
    required super.directory,
  }) {
    init();
  }

  ///The Database.
  late Isar _isar;

  ///The databaseID.
  int databaseID = 1;

  ///Initiate the database.
  @override
  init() {
    //Initialize Isar.
    // _isar = initialiseServerDatabase(directory: directory);

    //TODO: setup isolate initializer :D.
  }

  ///Once called object should be disposed of.
  @override
  Future close() async {
    _isar.close();
  }

  @override
  Directory get isarDirectory => throw UnimplementedError();

  @override
  Directory get photoDirectory => throw UnimplementedError();
}
