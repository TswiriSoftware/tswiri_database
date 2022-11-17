import 'package:isar/isar.dart';
import 'package:tswiri_database/src/collections/essential/photo/photo.dart';
import 'package:tswiri_database/src/collections/essential/ml_tags/ml_detected_label_text/ml_detected_label_text.dart';
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

  ///uid of `this`.
  @Name('uid')
  @Index(unique: true)
  late String uid;

  ///ObjectID.
  @Name("objectUID")
  late String objectUID;

  ///detectedLabelTextID.
  @Name("detectedLabelTextID")
  @Index()
  late String detectedLabelTextUID;

  ///Tag Confidence.
  @Name("confidence")
  late double confidence;

  ///Blacklisted.
  @Name("userFeedback")
  late bool? userFeedback;

  @override
  String toString() {
    return '\nObjectID: $objectUID, DetectedLabelTextID: $detectedLabelTextUID, Confidence: $confidence, UserFeedback: $userFeedback';
  }

  @override
  bool operator ==(Object other) {
    return other is MLObjectLabel &&
        id == other.id &&
        objectUID == other.objectUID &&
        detectedLabelTextUID == other.detectedLabelTextUID &&
        confidence == other.confidence &&
        userFeedback == other.userFeedback;
  }

  ///To json.
  Map toJson() => {
        'id': id,
        'uid': uid,
        'objectUID': objectUID,
        'detectedLabelTextUID': detectedLabelTextUID,
        'confidence': confidence,
        'blackListed': userFeedback,
      };

  ///From json.
  MLObjectLabel fromJson(Map<String, dynamic> json) {
    return MLObjectLabel()
      ..id = json['id']
      ..uid = json['uid']
      ..objectUID = json['objectUID']
      ..detectedLabelTextUID = json['detectedLabelTextUID']
      ..confidence = json['confidence']
      ..userFeedback = json['blackListed'];
  }

  @override
  int get hashCode => id.hashCode;
}
