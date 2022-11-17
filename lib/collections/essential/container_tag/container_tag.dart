import 'package:isar/isar.dart';
import 'package:tswiri_database/collections/essential/cataloged_container/cataloged_container.dart';
import 'package:tswiri_database/collections/essential/tag_text/tag_text.dart';
part 'container_tag.g.dart';

///[ContainerTag]
///
///  - `id` the id of `this`.
///  - `containerUID` The [CatalogedContainer]'s UID of `this`.
///  - `tagTextID` The [TagText]' ID `this` is linked to.
///
@Collection()
@Name("ContainerTag")
class ContainerTag {
  Id id = Isar.autoIncrement;

  @Name('uid')
  @Index(unique: true)
  late String uid;

  @Name("containerUID")
  late String containerUID;

  @Name("tagTextUID")
  late String tagTextUID;

  @override
  bool operator ==(Object other) {
    return other is ContainerTag &&
        id == other.id &&
        containerUID == other.containerUID &&
        tagTextUID == other.tagTextUID;
  }

  @override
  String toString() {
    return 'UID: $containerUID: Tag: $tagTextUID';
  }

  Map toJson() => {
        'id': id,
        'uid': uid,
        'containerUID': containerUID,
        'tagTextUID': tagTextUID,
      };

  ContainerTag fromJson(Map<String, dynamic> json) {
    return ContainerTag()
      ..id = json['id']
      ..uid = json['uid']
      ..containerUID = json['containerUID']
      ..tagTextUID = json['tagTextUID'] as String;
  }

  @override
  int get hashCode => id.hashCode;
}
