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

  ///ObjectID.
  @Name("objectID")
  late int objectID;

  ///The text tag.
  @Name("tagTextID")
  @Index()
  late int tagTextID;

  @override
  bool operator ==(Object other) {
    return other is ObjectLabel &&
        id == other.id &&
        objectID == other.objectID &&
        tagTextID == other.tagTextID;
  }

  @override
  String toString() {
    return 'photoID: $objectID, textID: $tagTextID';
  }

  Map toJson() => {'id': id, 'tagID': objectID, 'textID': tagTextID};

  ObjectLabel fromJson(Map<String, dynamic> json) {
    return ObjectLabel()
      ..id = json['id']
      ..objectID = json['tagID']
      ..tagTextID = json['textID'];
  }

  @override
  int get hashCode => id.hashCode;
}
