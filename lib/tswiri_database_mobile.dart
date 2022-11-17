import 'dart:io';
import 'package:tswiri_database/export.dart';

class TswiriDatabaseMobile {
  TswiriDatabaseMobile({
    required this.spaceDirectory,
  }) {
    init();
  }

  ///The directory where this space's data is stored.
  Directory spaceDirectory;

  late Isar _isar;

  ///Initialize the isar connection.
  init() {
    _isar = Isar.openSync(
      [
        ///List of all used Schemas.
        BarcodeBatchSchema,
        CameraCalibrationEntrySchema,
        CatalogedBarcodeSchema,
        CatalogedContainerSchema,
        CatalogedCoordinateSchema,
        CatalogedGridSchema,
        ContainerRelationshipSchema,
        ContainerTagSchema,
        ContainerTypeSchema,
        MLDetectedElementTextSchema,
        MLDetectedLabelTextSchema,
        MLObjectLabelSchema,
        MLObjectSchema,
        MLPhotoLabelSchema,
        MLTextBlockSchema,
        MLTextElementSchema,
        MLTextLineSchema,
        MarkerSchema,
        ObjectLabelSchema,
        PhotoLabelSchema,
        PhotoSchema,
        TagTextSchema
      ],
      directory: spaceDirectory.path,
      inspector: true,
    );
  }

  ///Directory where Isar database files are stored.
  Directory get isarDirectory {
    return Directory('${spaceDirectory.path}/isar');
  }

  ///Directory where photos are stored.
  Directory get photoDirectory {
    return Directory('${spaceDirectory.path}/photos');
  }

  ///Directory where thumbnails are stored.
  Directory get thumbnailDirectory {
    return Directory('${spaceDirectory.path}/thumbnails');
  }
}
