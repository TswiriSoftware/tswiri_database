import 'package:isar/isar.dart';
part 'ml_detected_label_text.g.dart';

///[MLDetectedLabelText]
///
///  - `id` the id of `this`.
///  - `detectedLabelText` The string value of `this`.
///  - `hidden` Is `this` hidden.
///
@Collection()
@Name("MLDetectedLabelText")
class MLDetectedLabelText {
  Id id = Isar.autoIncrement;

  @Name('uid')
  @Index(unique: true)
  late String uid;

  @Name("detectedLabelText")
  @Index(unique: true)
  late String detectedLabelText;

  @Name("hidden")
  late bool hidden;

  Map toJson() => {
        'id': id,
        'uid': uid,
        'detectedLabelText': detectedLabelText,
        'hidden': hidden,
      };

  MLDetectedLabelText fromJson(Map<String, dynamic> json) {
    return MLDetectedLabelText()
      ..id = json['id']
      ..uid = json['uid']
      ..detectedLabelText = json['detectedLabelText']
      ..hidden = json['hidden'] as bool;
  }
}
