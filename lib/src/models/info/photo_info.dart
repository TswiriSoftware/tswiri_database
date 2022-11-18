import 'dart:io';

import 'package:tswiri_database/src/collections/export.dart';

class PhotoInfo {
  PhotoInfo({
    required Isar isar,
    required Directory photoDirectory,
    required this.photo,
  }) {
    photoFile = File(
        '${photoDirectory.path}/${photo.photoName}.${photo.photoExtention}');
  }

  //The photo.
  Photo photo;

  ///The photo File.
  late File photoFile;
}
