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
  ///ID
  Id id = Isar.autoIncrement;

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
        'containerUID': containerUID,
        'parentUID': parentUID,
      };

  //From json.
  ContainerRelationship fromJson(Map<String, dynamic> json) {
    return ContainerRelationship()
      ..id = json['id']
      ..containerUID = json['containerUID']
      ..parentUID = json['parentUID'];
  }

  @override
  int get hashCode => id.hashCode;
}
