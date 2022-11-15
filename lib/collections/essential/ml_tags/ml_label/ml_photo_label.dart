import 'package:isar/isar.dart';
import 'package:tswiri_database/collections/essential/photo/photo.dart';
import 'package:tswiri_database/collections/essential/ml_tags/ml_detected_label_text/ml_detected_label_text.dart';
part 'ml_photo_label.g.dart';

///[MLPhotoLabel]
///
///  - `id` the id of `this`.
///  - `photoID` The [Photo] id this is linked to.
///  - `detectedLabelTextID` The [MLDetectedLabelText]'s ID `this` is linked to.
///  - `confidence` The confidence that `this` is a valid label.
///  - `userFeedback` The userfeedback of `this`.
///
@Collection()
@Name("MLPhotoLabel")
class MLPhotoLabel {
  Id id = Isar.autoIncrement;

  ///PhotoID.
  @Name("photoID")
  late int? photoID;

  ///DetectedLabelTextID.
  @Name("detectedLabelTextID")
  @Index(composite: [CompositeIndex('userFeedback')])
  late int detectedLabelTextID;

  ///Tag Confidence.
  @Name("confidence")
  late double confidence;

  ///Blacklisted.
  @Name("userFeedback")
  @Index()
  late bool? userFeedback;

  @override
  bool operator ==(Object other) {
    return other is MLPhotoLabel &&
        id == other.id &&
        photoID == other.photoID &&
        detectedLabelTextID == other.detectedLabelTextID &&
        confidence == other.confidence &&
        userFeedback == other.userFeedback;
  }

  @override
  String toString() {
    return '\nPhotoID: $photoID, DetectedLabelTextID: $detectedLabelTextID, Confidence: $confidence, UserFeedback: $userFeedback';
  }

  ///To json.
  Map toJson() => {
        'id': id,
        'photoID': photoID,
        'textID': detectedLabelTextID,
        'confidence': confidence,
        'blackListed': userFeedback,
      };

  ///To json.
  MLPhotoLabel fromJson(Map<String, dynamic> json) {
    return MLPhotoLabel()
      ..id = json['id']
      ..photoID = json['photoID']
      ..detectedLabelTextID = json['textID']
      ..confidence = json['confidence']
      ..userFeedback = json['blackListed'];
  }

  @override
  int get hashCode => id.hashCode;
}
