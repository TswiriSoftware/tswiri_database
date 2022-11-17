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

  @Name('uid')
  @Index(unique: true)
  late String uid;

  @Name("photoUID")
  late String photoUID;

  @Name("lineUID")
  late String lineUID;

  @Name("lineIndex")
  late int lineIndex;

  @Name("mlDetectedElementTextUID")
  late String mlDetectedElementTextUID;

  @Name("cornerPoints")
  late CornerPoints cornerPoints;

  @Name("userFeedback")
  late bool? userFeedback;

  @override
  String toString() {
    return 'ID: $id, LineID: $lineUID, LineIndex: $lineIndex, DetectedElementTextID: $mlDetectedElementTextUID, CornerPoints: $cornerPoints';
  }

  ///To json.
  Map toJson() => {
        'id': id,
        'uid': uid,
        'photoUID': photoUID,
        'lineUID': lineUID,
        'lineIndex': lineIndex,
        'mlDetectedElementTextUID': mlDetectedElementTextUID,
        'userFeedback': userFeedback,
        'cornerPoints': cornerPoints.data,
      };

  ///From json.
  MLTextElement fromJson(Map<String, dynamic> json) {
    List<int> cp = (json['cornerPoints'] as List<dynamic>).cast<int>();

    return MLTextElement()
      ..id = json['id']
      ..uid = json['uid']
      ..photoUID = json['photoUID']
      ..lineUID = json['lineUID']
      ..lineIndex = json['lineIndex']
      ..mlDetectedElementTextUID = json['mlDetectedElementTextUID']
      ..userFeedback = json['userFeedback']
      ..cornerPoints = CornerPoints.fromMessage(cp);
  }
}
