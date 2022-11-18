import 'dart:io';

abstract class TswiriDatabaseObject {
  TswiriDatabaseObject({
    required this.directory,
  });

  ///The directory of the database.
  Directory directory;

  ///Used to initiate the isar database.
  void init() {}

  ///Used to close the database.
  Future close() async {}

  ///The photos Directory
  Directory get photoDirectory;

  Directory get isarDirectory;
}
