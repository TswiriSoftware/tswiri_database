import 'dart:math';
import 'dart:ui';
import 'package:isar/isar.dart';
import 'package:tswiri_database/embedded/corner_points/corner_points.dart';

part 'ml_text_block.g.dart';

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
@Name("MLTextBlock")
class MLTextBlock {
  ///BlockID.
  Id id = Isar.autoIncrement;

  ///RecognizedLanguages.
  @Name("recognizedLanguages")
  late List<String> recognizedLanguages;

  ///CornerPoints.
  @Name("cornerPoints")
  late CornerPoints cornerPoints;

  @override
  String toString() {
    return '\nID: $id, Languages: $recognizedLanguages, CornerPoints: $cornerPoints';
  }

  ///To json.
  Map toJson() => {
        'id': id,
        'recognizedLanguages': recognizedLanguages,
        'cornerPoints': cornerPoints.data,
      };

  ///From json.
  MLTextBlock fromJson(Map<String, dynamic> json) {
    List<int> cp = (json['cornerPoints'] as List<dynamic>).cast<int>();

    return MLTextBlock()
      ..id = json['id']
      ..recognizedLanguages =
          (json['recognizedLanguages'] as List<dynamic>).cast<String>()
      ..cornerPoints = CornerPoints.fromMessage(cp);
  }
}
