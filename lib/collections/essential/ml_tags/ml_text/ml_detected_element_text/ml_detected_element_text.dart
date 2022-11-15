import 'package:isar/isar.dart';
import 'package:tswiri_database/collections/essential/tag_text/tag_text.dart';
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
  ///DetectedElementTextID.
  Id id = Isar.autoIncrement;

  ///DetectedText.
  @Name("detectedText")
  @Index(unique: true)
  late String detectedText;

  ///TagTextID.
  @Name("tagTextID")
  late int? tagTextID;

  ///To json.
  Map toJson() => {
        'id': id,
        'detectedText': detectedText,
        'tagTextID': tagTextID,
      };

  ///From json.
  MLDetectedElementText fromJson(Map<String, dynamic> json) {
    return MLDetectedElementText()
      ..id = json['id']
      ..detectedText = json['detectedText']
      ..tagTextID = json['tagTextID'];
  }
}
