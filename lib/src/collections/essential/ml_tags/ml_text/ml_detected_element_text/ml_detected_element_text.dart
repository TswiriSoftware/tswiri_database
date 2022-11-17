import 'package:isar/isar.dart';
import 'package:tswiri_database/src/collections/essential/tag_text/tag_text.dart';
part 'ml_detected_element_text.g.dart';

///[MLDetectedElementText]
///
///  - `id` the id of `this`.
///  - `detectedText` The detected text of `this`.
///  - `tagTextID` The [TagText]'s ID `this` is linked to.
///
@Collection()
@Name("MLDetectedElementText")
class MLDetectedElementText {
  Id id = Isar.autoIncrement;

  @Name('uid')
  @Index(unique: true)
  late String uid;

  @Name("detectedText")
  @Index(unique: true)
  late String detectedText;

  @Name("tagTextID")
  late String? tagTextID;

  Map toJson() => {
        'id': id,
        'uid': uid,
        'detectedText': detectedText,
        'tagTextID': tagTextID,
      };

  MLDetectedElementText fromJson(Map<String, dynamic> json) {
    return MLDetectedElementText()
      ..id = json['id']
      ..uid = json['uid']
      ..detectedText = json['detectedText']
      ..tagTextID = json['tagTextID'];
  }
}
