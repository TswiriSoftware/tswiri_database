import 'package:isar/isar.dart';
import 'package:tswiri_database/embedded/corner_points/corner_points.dart';
import 'package:tswiri_database/collections/essential/photo/photo.dart';
import 'package:tswiri_database/collections/essential/ml_tags/ml_text/ml_text_line/ml_text_line.dart';
import 'package:tswiri_database/collections/essential/ml_tags/ml_text/ml_detected_element_text/ml_detected_element_text.dart';
part 'ml_text_element.g.dart';

///[MLTextElement]
///
///  - `id` the id of `this`.
///  - `photoID` The [Photo] id `this` is linked to.
///  - `lineID` The [MLTextLine]'s id `this` is linked to.
///  - `lineIndex` The line index of `this`.
///  - `detectedElementTextID` The [MLDetectedElementText]'s ID `this` is linked to.
///  - `cornerPoints` The cornerPoints of `this`.
///  - `userFeedback` The userfeedback of `this`.
///
@Collection()
@Name("MLTextElement")
class MLTextElement {
  Id id = Isar.autoIncrement;

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
  late CornerPoints cornerPoints;

  ///UserFeedback.
  @Name("userFeedback")
  late bool? userFeedback;

  @override
  String toString() {
    return 'ID: $id, LineID: $lineID, LineIndex: $lineIndex, DetectedElementTextID: $detectedElementTextID, CornerPoints: $cornerPoints';
  }

  ///To json.
  Map toJson() => {
        'id': id,
        'photoID': photoID,
        'lineID': lineID,
        'lineIndex': lineIndex,
        'detectedElementTextID': detectedElementTextID,
        'userFeedback': userFeedback,
        'cornerPoints': cornerPoints.data,
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
      ..cornerPoints = CornerPoints.fromMessage(cp);
  }
}