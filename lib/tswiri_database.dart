library tswiri_database;

import 'dart:io';
import 'package:isar/isar.dart';

///The folder where isar and photo files are stored.
Directory? spaceDirectory;
String isarDirectoryPref = 'isarDirectory';

Directory? isarDirectory;
Directory? photoDirectory;
Directory? thumbnailDirectory;

///Isar.
Isar? isar; //TODO , get rid of this. '_'



// TODO: Export any libraries intended for clients of this package.
