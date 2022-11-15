import 'package:isar/isar.dart';
import 'package:tswiri_database/embedded/corner_points/corner_points.dart';
import 'package:tswiri_database/collections/essential/ml_tags/ml_text/ml_text_block/ml_text_block.dart';
part 'ml_text_line.g.dart';

///[MLTextLine]
///
///  - `id` the id of `this`.
///  - `blockID` The [MLTextBlock]'s ID `this` is linked to.
///  - `blockIndex` The [MLTextLine]'s id `this` is linked to.
///  - `recognizedLanguages` The recognized Languages of `this`.
///  - `cornerPoints` The cornerPoints of `this`.
///
@Collection()
@Name("MLTextLine")
class MLTextLine {
  ///LineID.
  Id id = Isar.autoIncrement;

  ///BlockID.
  @Name("blockID")
  late int blockID;

  ///blockIndex.
  @Name("blockIndex")
  late int blockIndex;

  ///RecognizedLanguages.
  @Name("recognizedLanguages")
  late List<String> recognizedLanguages;

  ///CornerPoints.
  @Name("cornerPoints")
  late CornerPoints cornerPoints;

  @override
  String toString() {
    return 'ID: $id, BlockID: $blockID, BlockIndex: $blockIndex, Languages: $recognizedLanguages, CornerPoints: $cornerPoints';
  }

  ///To json.
  Map toJson() => {
        'id': id,
        'blockID': blockID,
        'blockIndex': blockIndex,
        'recognizedLanguages': recognizedLanguages,
        'cornerPoints': cornerPoints.data,
      };

  ///From json.
  MLTextLine fromJson(Map<String, dynamic> json) {
    List<int> cp = (json['cornerPoints'] as List<dynamic>).cast<int>();
    return MLTextLine()
      ..id = json['id']
      ..blockID = json['blockID']
      ..blockIndex = json['blockIndex']
      ..recognizedLanguages =
          (json['recognizedLanguages'] as List<dynamic>).cast<String>()
      ..cornerPoints = CornerPoints.fromMessage(cp);
  }
}