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

  @Name('uid')
  @Index(unique: true)
  late String uid;

  @Name("photoUID")
  late String photoUID;

  @Name("detectedLabelTextUID")
  late String detectedLabelTextUID;

  @Name("confidence")
  late double confidence;

  @Name("userFeedback")
  late bool? userFeedback;

  @override
  bool operator ==(Object other) {
    return other is MLPhotoLabel &&
        id == other.id &&
        photoUID == other.photoUID &&
        detectedLabelTextUID == other.detectedLabelTextUID &&
        confidence == other.confidence &&
        userFeedback == other.userFeedback;
  }

  @override
  String toString() {
    return '\nPhotoID: $photoUID, DetectedLabelTextID: $detectedLabelTextUID, Confidence: $confidence, UserFeedback: $userFeedback';
  }

  ///To json.
  Map toJson() => {
        'id': id,
        'uid': uid,
        'photoID': photoUID,
        'textID': detectedLabelTextUID,
        'confidence': confidence,
        'blackListed': userFeedback,
      };

  ///To json.
  MLPhotoLabel fromJson(Map<String, dynamic> json) {
    return MLPhotoLabel()
      ..id = json['id']
      ..uid = json['uid']
      ..photoUID = json['photoID']
      ..detectedLabelTextUID = json['textID']
      ..confidence = json['confidence']
      ..userFeedback = json['blackListed'];
  }

  @override
  int get hashCode => id.hashCode;
}
