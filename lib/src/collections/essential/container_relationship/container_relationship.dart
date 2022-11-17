import 'package:isar/isar.dart';
part 'container_relationship.g.dart';

///[ContainerRelationship]
///
///  - `id` the id of `this`.
///  - `containerUID` The Child's containerUID of `this`.
///  - `parentUID` The Parent's containerUID of `this`.
///
@Collection()
@Name("ContainerRelationship")
class ContainerRelationship {
  Id id = Isar.autoIncrement;

  ///uid of `this`.
  @Name('uid')
  @Index(unique: true)
  late String uid;

  ///ContainerUID
  @Name("containerUID")
  late String containerUID;

  ///ParentUID
  @Name("parentUID")
  late String? parentUID;

  @override
  bool operator ==(Object other) {
    return other is ContainerRelationship &&
        id == other.id &&
        containerUID == other.containerUID &&
        containerUID == other.containerUID &&
        parentUID == other.parentUID;
  }

  @override
  String toString() {
    return '\ncontainerUID: $containerUID, parentUID: $parentUID';
  }

  //To json.
  Map toJson() => {
        'id': id,
        'uid': uid,
        'containerUID': containerUID,
        'parentUID': parentUID,
      };

  //From json.
  ContainerRelationship fromJson(Map<String, dynamic> json) {
    return ContainerRelationship()
      ..id = json['id']
      ..uid = json['uid']
      ..containerUID = json['containerUID']
      ..parentUID = json['parentUID'];
  }

  @override
  int get hashCode => id.hashCode;
}
