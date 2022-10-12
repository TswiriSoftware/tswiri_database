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

  ///To json.
  Map toJson() => {
        'id': id,
        'recognizedLanguages': recognizedLanguages,
        'cornerPoints': [
          cornerPoints[0].x,
          cornerPoints[0].y,
          cornerPoints[1].x,
          cornerPoints[1].y,
          cornerPoints[2].x,
          cornerPoints[2].y,
          cornerPoints[3].x,
          cornerPoints[3].y,
        ],
      };

  ///From json.
  MLTextBlock fromJson(Map<String, dynamic> json) {
    List<int> cp = (json['cornerPoints'] as List<dynamic>).cast<int>();
    return MLTextBlock()
      ..id = json['id']
      ..recognizedLanguages =
          (json['recognizedLanguages'] as List<dynamic>).cast<String>()
      ..cornerPoints = [
        Point(cp[0], cp[1]),
        Point(cp[2], cp[3]),
        Point(cp[4], cp[5]),
        Point(cp[6], cp[7]),
      ];
  }
}
