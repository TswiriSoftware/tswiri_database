import 'package:isar/isar.dart';
import 'package:tswiri_database/collections/essential/photo/photo.dart';
part 'ml_object.g.dart';

///[MLObject]
///
///  - `id` the id of `this`.
///  - `photoID` The [Photo] id this is linked to.
///  - `boundingBox` The bounding box of `this`.
///

@Collection()
@Name("MLObject")
class MLObject {
  Id id = Isar.autoIncrement;

  ///PhotoID.
  @Name("photoID")
  late int photoID;

  ///Bounding Box.
  ///The boundingBox. use rect.fromLTRB
  @Name("boundingBox")
  late List<double> boundingBox;

  @override
  String toString() {
    return '\nObjectID: $id, PhotoID: $photoID, BoundingBox: $boundingBox';
  }

  @override
  bool operator ==(Object other) {
    return other is MLObject &&
        id == other.id &&
        photoID == other.photoID &&
        boundingBox == other.boundingBox;
  }

  ///To json.
  Map toJson() => {
        'id': id,
        'photoID': photoID,
        'blackListed': boundingBox,
      };

  ///From json.
  MLObject fromJson(Map<String, dynamic> json) {
    return MLObject()
      ..id = json['id']
      ..photoID = json['photoID']
      ..boundingBox = (json['blackListed'] as List<dynamic>).cast<double>();
  }

  @override
  int get hashCode => id.hashCode;

  // Rect getBoundingBox() {
  //   return Rect.fromLTRB(
  //       boundingBox[0], boundingBox[1], boundingBox[2], boundingBox[3]);
  // }
}
