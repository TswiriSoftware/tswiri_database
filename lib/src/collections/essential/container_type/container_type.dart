import 'package:isar/isar.dart';
part 'container_type.g.dart';

///[ContainerType]
///
///  - `id` the id of `this`.
/// - `name` The name of `this`.
/// - `description` The description of `this`.
/// - `moveable` Can `this` be moved.
/// - `enclosing` Is `this`'s barcode a marker by defaut.
/// - `canContain` List of containers that `this` can contain.
/// - `preferredChildContainer` ID of the preferred child `this`.
/// - `containerColor` The color of `this`.
/// - `iconData` The IconData of `this`.
///
@Collection()
@Name("ContainerType")
class ContainerType {
  ///ContainerTypeID
  Id id = Isar.autoIncrement;

  @Name('uid')
  @Index(unique: true)
  late String uid;

  @Name("name")
  late String name;

  @Name("description")
  late String description;

  @Name("moveable")
  late bool moveable;

  @Name("enclosing")
  late bool enclosing;

  @Name("canContain")
  late List<int> canContain;

  @Name("preferredChildContainer")
  late int preferredChildContainer;

  @Name("color")
  late String color;

  @Name("iconData")
  late List<String> iconData;

  @override
  String toString() {
    return '''-------------------------------------
containerType: $name,
containerDescription: $description,
moveable: $moveable, canContain: $canContain
color: $color
iconData: $iconData
-------------------------------------\n''';
  }

  //To json.
  Map toJson() => {
        'id': id,
        'uid': uid,
        'containerType': name,
        'containerDescription': description,
        'moveable': moveable,
        'enclosing': enclosing,
        'canContain': canContain,
        'containerColor': color,
      };

  //From json.
  ContainerType fromJson(Map<String, dynamic> json) {
    return ContainerType()
      ..id = json['id']
      ..uid = json['uid']
      ..name = json['containerType']
      ..description = json['containerDescription']
      ..enclosing = json['enclosing']
      ..canContain = (json['canContain'] as List<dynamic>).cast<int>()
      ..moveable = json['moveable']
      ..color = json['containerColor'];
  }
}
