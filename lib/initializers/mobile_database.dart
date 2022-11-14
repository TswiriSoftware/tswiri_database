part of tswiri_database;
// import 'package:tswiri_database/export.dart';
// import 'package:tswiri_database/tswiri_database.dart';

///Initiate a isar connection
/// - Optional Directory.
/// - Inspector.
void initiateMobileIsar({String? directory, bool? inspector}) {
  // if (_isar != null && _isar!.isOpen) return;

  _isar = Isar.openSync(
    [
      //Barcode Batch.
      BarcodeBatchSchema,

      //Barcode Properties.
      CatalogedBarcodeSchema,

      //Camera Calibration Entry.
      CameraCalibrationEntrySchema,

      //Container Entry.
      CatalogedContainerSchema,

      //Container Relationship.
      ContainerRelationshipSchema,

      //Container Tag.
      ContainerTagSchema,

      //Container Type.
      ContainerTypeSchema,

      //Cataloged Grids
      CatalogedGridSchema,

      //ML Detected Label Text.
      MLDetectedLabelTextSchema,
      //Ml Label.
      MLPhotoLabelSchema,
      //Photo Label.
      PhotoLabelSchema,

      //Ml Object.
      MLObjectSchema,
      //ML Object Label.
      MLObjectLabelSchema,
      //Object Label.
      ObjectLabelSchema,

      //ML Detected Text Element Text.
      MLDetectedElementTextSchema,
      //ML Text Block.
      MLTextBlockSchema,
      //ML Text Element.
      MLTextElementSchema,
      //ML Text Line.
      MLTextLineSchema,

      //Photo.
      PhotoSchema,

      //Marker
      MarkerSchema,

      //Cataloged Coordinate
      CatalogedCoordinateSchema,

      //Tag Text.
      TagTextSchema,
    ],
    directory: directory ?? isarDirectory!.path,
    inspector: inspector ?? true,
  );
}

Isar inititateMobileIsarIsolate({String? directory, bool? inspector}) {
  return Isar.openSync(
    [
      //Barcode Batch.
      BarcodeBatchSchema,

      //Barcode Properties.
      CatalogedBarcodeSchema,

      //Camera Calibration Entry.
      CameraCalibrationEntrySchema,

      //Container Entry.
      CatalogedContainerSchema,

      //Container Relationship.
      ContainerRelationshipSchema,

      //Container Tag.
      ContainerTagSchema,

      //Container Type.
      ContainerTypeSchema,

      //Cataloged Grids
      CatalogedGridSchema,

      //ML Detected Label Text.
      MLDetectedLabelTextSchema,
      //Ml Label.
      MLPhotoLabelSchema,
      //Photo Label.
      PhotoLabelSchema,

      //Ml Object.
      MLObjectSchema,
      //ML Object Label.
      MLObjectLabelSchema,
      //Object Label.
      ObjectLabelSchema,

      //ML Detected Text Element Text.
      MLDetectedElementTextSchema,
      //ML Text Block.
      MLTextBlockSchema,
      //ML Text Element.
      MLTextElementSchema,
      //ML Text Line.
      MLTextLineSchema,

      //Photo.
      PhotoSchema,

      //Marker
      MarkerSchema,

      //Cataloged Coordinate
      CatalogedCoordinateSchema,

      //Tag Text.
      TagTextSchema,
    ],
    directory: directory ?? isarDirectory!.path,
    inspector: inspector ?? true,
  );
}
