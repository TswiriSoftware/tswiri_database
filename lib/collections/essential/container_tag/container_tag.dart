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

  ///The [CatalogedContainer]'s UID.
  @Name("containerUID")
  late String containerUID;

  ///The TagTextID of this [ContainerTag].
  @Name("tagTextID")
  late int tagTextID;

  @override
  bool operator ==(Object other) {
    return other is ContainerTag &&
        id == other.id &&
        containerUID == other.containerUID &&
        tagTextID == other.tagTextID;
  }

  @override
  String toString() {
    return 'UID: $containerUID: Tag: $tagTextID';
  }

  Map toJson() => {
        'id': id,
        'containerUID': containerUID,
        'tagTextID': tagTextID,
      };

  ContainerTag fromJson(Map<String, dynamic> json) {
    return ContainerTag()
      ..id = json['id']
      ..containerUID = json['containerUID']
      ..tagTextID = json['tagTextID'] as int;
  }

  @override
  int get hashCode => id.hashCode;
}
