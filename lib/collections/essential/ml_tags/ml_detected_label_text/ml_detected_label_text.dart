import 'package:isar/isar.dart';
part 'ml_detected_label_text.g.dart';

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
