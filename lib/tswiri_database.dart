library tswiri_database;

import 'dart:io';

import 'package:isar/isar.dart';
export 'package:tswiri_database/functions/backup/backup_restore_functions.dart';
export 'package:tswiri_database/functions/backup/create_backup.dart';
export 'package:tswiri_database/functions/backup/restore_backup.dart';

///Isar directory.
Directory? isarDirectory;
String isarDirectoryPref = 'isarDirectory';

///Photo Directory
Directory? photoDirectory;

///Isar reference.
Isar? isar;
