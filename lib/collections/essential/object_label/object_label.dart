import 'package:isar/isar.dart';
import 'package:tswiri_database/collections/essential/ml_tags/ml_object/ml_object/ml_object.dart';
import 'package:tswiri_database/collections/essential/tag_text/tag_text.dart';
part 'object_label.g.dart';

///[ObjectLabel]
///
///  - `id` the id of `this`.
///  - `objectID` The [MLObject]'s ID `this` is linked to.
///  - `tagTextID` The [TagText]'s id `this` is linked to.
///
@Collection()
@Name("ObjectLabel")
class ObjectLabel {
  Id id = Isar.autoIncrement;

  @Name('uid')
  @Index(unique: true)
  late String uid;

  @Name("objectID")
  late String objectUID;

  @Name("tagTextUID")
  @Index()
  late String tagTextUID;

  @override
  bool operator ==(Object other) {
    return other is ObjectLabel &&
        id == other.id &&
        objectUID == other.objectUID &&
        tagTextUID == other.tagTextUID;
  }

  @override
  String toString() {
    return 'photoID: $objectUID, textID: $tagTextUID';
  }

  Map toJson() => {
        'id': id,
        'objectUID': objectUID,
        'tagTextUID': tagTextUID,
      };

  ObjectLabel fromJson(Map<String, dynamic> json) {
    return ObjectLabel()
      ..id = json['id']
      ..objectUID = json['objectUID']
      ..tagTextUID = json['tagTextUID'];
  }

  @override
  int get hashCode => id.hashCode;
}
