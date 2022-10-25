import 'package:isar/isar.dart';

import 'package:tswiri_database/tswiri_database.dart';
import 'collections/barcode_batch/barcode_batch.dart';
import 'collections/camera_calibration/camera_calibration_entry.dart';
import 'collections/cataloged_barcode/cataloged_barcode.dart';
import 'collections/cataloged_container/cataloged_container.dart';
import 'collections/cataloged_coordinate/cataloged_coordinate.dart';
import 'collections/cataloged_grid/cataloged_grid.dart';
import 'collections/container_relationship/container_relationship.dart';
import 'collections/container_tag/container_tag.dart';
import 'collections/container_type/container_type.dart';
import 'collections/marker/marker.dart';
import 'collections/ml_tags/ml_detected_label_text/ml_detected_label_text.dart';
import 'collections/ml_tags/ml_label/ml_photo_label.dart';
import 'collections/ml_tags/ml_object/ml_object/ml_object.dart';
import 'collections/ml_tags/ml_object/ml_object_label/ml_object_label.dart';
import 'collections/ml_tags/ml_text/ml_detected_element_text/ml_detected_element_text.dart';
import 'collections/ml_tags/ml_text/ml_text_block/ml_text_block.dart';
import 'collections/ml_tags/ml_text/ml_text_element/ml_text_element.dart';
import 'collections/ml_tags/ml_text/ml_text_line/ml_text_line.dart';
import 'collections/object_label/object_label.dart';
import 'collections/photo/photo.dart';
import 'collections/photo_label/photo_label.dart';
import 'collections/tag_text/tag_text.dart';

///Initiate a isar connection
/// - Optional Directory.
/// - Inspector.
Isar initiateMobileIsar({String? directory, bool? inspector}) {
  Isar isar = Isar.openSync(
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
    directory: directory ?? spaceDirectory!.path,
    inspector: inspector ?? true,
  );

  return isar;
}
