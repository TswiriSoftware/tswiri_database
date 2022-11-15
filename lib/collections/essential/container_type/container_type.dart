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

  ///The name of this [ContainerType].
  @Name("name")
  late String name;

  ///The description of this [ContainerType].
  @Name("description")
  late String description;

  ///Can this container be moved.
  @Name("moveable")
  late bool moveable;

  ///Is this container's barcode a marker by defaut.
  @Name("enclosing")
  late bool enclosing;

  ///List of containers that this container can contain.
  @Name("canContain")
  late List<int> canContain;

  ///ID of the preferred child container.
  @Name("preferredChildContainer")
  late int preferredChildContainer;

  ///Container color.
  @Name("color")
  late String color;

  ///Container IconData.
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
      ..name = json['containerType']
      ..description = json['containerDescription']
      ..enclosing = json['enclosing']
      ..canContain = (json['canContain'] as List<dynamic>).cast<int>()
      ..moveable = json['moveable']
      ..color = json['containerColor'];
  }
}
