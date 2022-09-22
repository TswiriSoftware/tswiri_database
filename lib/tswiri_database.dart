library tswiri_database;

import 'dart:io';
import 'package:isar/isar.dart';

///The folder where isar and photo files are stored.
Directory? spaceDirectory;
String isarDirectoryPref = 'isarDirectory';

///Photo directory
Directory? photoDirectory;

Directory? thumbnailDirectory;

///Isar.
Isar? isar;
