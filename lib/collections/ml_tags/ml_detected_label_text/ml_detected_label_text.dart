import 'package:isar/isar.dart';
part 'ml_detected_label_text.g.dart';
//TODO: finish comments.

@Collection()
@Name("MLDetectedLabelText")
class MLDetectedLabelText {
  ///MLDetectedLabelTextID.
  int id = Isar.autoIncrement;

  ///MLDetectedLabelText.
  @Name("detectedLabelText")
  @Index(unique: true)
  late String detectedLabelText;

  ///Blacklisted.
  @Name("hidden")
  late bool hidden;
}
