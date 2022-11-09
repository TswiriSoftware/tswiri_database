import 'package:isar/isar.dart';
import 'package:tswiri_database/embedded/corner_points/corner_points.dart';
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
