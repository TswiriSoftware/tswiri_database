import 'dart:math';
import 'dart:ui';

import 'package:isar/isar.dart';
import 'package:tswiri_database/converters/corner_point_converter.dart';
part 'ml_text_element.g.dart';

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
@Name("MLTextElement")
class MLTextElement {
  int id = Isar.autoIncrement;

  ///PhotoID.
  @Name("photoID")
  late int photoID;

  ///lineID.
  @Name("lineID")
  late int lineID;

  ///LineIndex.
  @Name("lineIndex")
  late int lineIndex;

  ///DetectedElementTextID.
  @Name("detectedElementTextID")
  late int detectedElementTextID;

  ///CornerPoints.
  @Name("cornerPoints")
  @CornerPointConverter()
  late List<Point<int>> cornerPoints;

  ///UserFeedback.
  @Name("userFeedback")
  late bool? userFeedback;

  @override
  String toString() {
    return 'ID: $id, LineID: $lineID, LineIndex: $lineIndex, DetectedElementTextID: $detectedElementTextID, CornerPoints: $cornerPoints';
  }

  Rect getBoundingBox() {
    return Rect.fromPoints(
        Offset(cornerPoints[0].x.toDouble(), cornerPoints[0].y.toDouble()),
        Offset(cornerPoints[2].x.toDouble(), cornerPoints[2].y.toDouble()));
  }

  ///To json.
  Map toJson() => {
        'id': id,
        'photoID': photoID,
        'lineID': lineID,
        'lineIndex': lineIndex,
        'detectedElementTextID': detectedElementTextID,
        'userFeedback': userFeedback,
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
  MLTextElement fromJson(Map<String, dynamic> json) {
    List<int> cp = (json['cornerPoints'] as List<dynamic>).cast<int>();
    return MLTextElement()
      ..id = json['id']
      ..photoID = json['photoID']
      ..lineID = json['lineID']
      ..lineIndex = json['lineIndex']
      ..detectedElementTextID = json['detectedElementTextID']
      ..userFeedback = json['userFeedback']
      ..cornerPoints = [
        Point(cp[0], cp[1]),
        Point(cp[2], cp[3]),
        Point(cp[4], cp[5]),
        Point(cp[6], cp[7]),
      ];
  }
}
