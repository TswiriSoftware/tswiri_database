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
  ///MLDetectedLabelTextID.
  Id id = Isar.autoIncrement;

  ///MLDetectedLabelText.
  @Name("detectedLabelText")
  @Index(unique: true)
  late String detectedLabelText;

  ///Blacklisted.
  @Name("hidden")
  late bool hidden;

  ///To json.
  Map toJson() => {
        'id': id,
        'detectedLabelText': detectedLabelText,
        'hidden': hidden,
      };

  ///From json.
  MLDetectedLabelText fromJson(Map<String, dynamic> json) {
    return MLDetectedLabelText()
      ..id = json['id']
      ..detectedLabelText = json['detectedLabelText']
      ..hidden = json['hidden'] as bool;
  }
}
