import 'dart:math';
import 'dart:ui';
import 'package:isar/isar.dart';
import 'package:tswiri_database/converters/corner_point_converter.dart';

part 'ml_text_block.g.dart';

///TODO: finish commenting.

///Stores details about a container (Created by user).
///
///  - ```containerUID``` Unique identifier.
///  - ```containerTypeID``` Type of container [ContainerType].
///  - ```name``` Name of the container.
///  - ```description``` Description of the container.
///  - ```barcodeUID``` Barcode linked to this container.
///
@Collection()
@Name("MLTextBlock")
class MLTextBlock {
  ///BlockID.
  int id = Isar.autoIncrement;

  ///RecognizedLanguages.
  @Name("recognizedLanguages")
  late List<String> recognizedLanguages;

  ///CornerPoints.
  @Name("cornerPoints")
  @CornerPointConverter()
  late List<Point<int>> cornerPoints;

  @override
  String toString() {
    return '\nID: $id, Languages: $recognizedLanguages, CornerPoints: $cornerPoints';
  }

  Rect getBoundingBox() {
    return Rect.fromPoints(
        Offset(cornerPoints[0].x.toDouble(), cornerPoints[0].y.toDouble()),
        Offset(cornerPoints[2].x.toDouble(), cornerPoints[2].y.toDouble()));
  }
}
