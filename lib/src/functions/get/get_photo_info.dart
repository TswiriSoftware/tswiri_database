import 'dart:io';

import 'package:tswiri_database/src/models/info/photo_info.dart';

import '../../collections/export.dart';

///Get [PhotoInfo] of this [Photo].
PhotoInfo getPhotoInfo({
  required Isar isar,
  required Photo photo,
  required Directory photoDirectory,
}) {
  return PhotoInfo(isar: isar, photoDirectory: photoDirectory, photo: photo);
}
