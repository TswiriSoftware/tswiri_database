import 'dart:io';

import 'package:tswiri_database/src/collections/export.dart';
import 'package:tswiri_database/src/initializers/server_database.dart';
import 'package:tswiri_database/src/models/database/tswiri_database_object.dart';

class TswiriServerDatabase extends TswiriDatabaseObject {
  TswiriServerDatabase({
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
    _isar = initialiseServerDatabase(directory: directory);
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
