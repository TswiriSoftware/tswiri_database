import 'dart:io';
import 'package:tswiri_database/src/collections/export.dart';

Isar initialiseMobileDatabase({
  required Directory directory,
}) {
  return Isar.openSync(
    [
      ///Essential Schemas.
      BarcodeBatchSchema,
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
      TagTextSchema,

      //Mobile specific.
      DatabaseInfoSchema,
      CameraCalibrationEntrySchema,
    ],
    directory: directory.path,
    inspector: true,
  );
}
