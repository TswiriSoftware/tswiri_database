import 'package:isar/isar.dart';
import 'package:tswiri_database/collections/essential/photo/photo.dart';
import 'package:tswiri_database/collections/essential/ml_tags/ml_detected_label_text/ml_detected_label_text.dart';
part 'ml_object_label.g.dart';

///[MLObjectLabel]
///
///  - `id` the id of `this`.
///  - `photoID` The [Photo] id `this` is linked to.
///  - `detectedLabelTextID` The [MLDetectedLabelText]'s ID `this` is linked to.
///  - `confidence` The confidence that `this` is a valid label.
///  - `userFeedback` The userfeedback of `this`.
///

@Collection()
@Name("MLObjectLabel")
class MLObjectLabel {
  ///ObjectLabelID.
  Id id = Isar.autoIncrement;

  ///ObjectID.
  @Name("objectID")
  late int objectID;

  ///detectedLabelTextID.
  @Name("detectedLabelTextID")
  @Index()
  late int detectedLabelTextID;

  ///Tag Confidence.
  @Name("confidence")
  late double confidence;

  ///Blacklisted.
  @Name("userFeedback")
  late bool? userFeedback;

  @override
  String toString() {
    return '\nObjectID: $objectID, DetectedLabelTextID: $detectedLabelTextID, Confidence: $confidence, UserFeedback: $userFeedback';
  }

  @override
  bool operator ==(Object other) {
    return other is MLObjectLabel &&
        id == other.id &&
        objectID == other.objectID &&
        detectedLabelTextID == other.detectedLabelTextID &&
        confidence == other.confidence &&
        userFeedback == other.userFeedback;
  }

  ///To json.
  Map toJson() => {
        'id': id,
        'photoID': objectID,
        'textID': detectedLabelTextID,
        'confidence': confidence,
        'blackListed': userFeedback,
      };

  ///From json.
  MLObjectLabel fromJson(Map<String, dynamic> json) {
    return MLObjectLabel()
      ..id = json['id']
      ..objectID = json['photoID']
      ..detectedLabelTextID = json['textID']
      ..confidence = json['confidence']
      ..userFeedback = json['blackListed'];
  }

  @override
  int get hashCode => id.hashCode;
}
