import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:tswiri_database/embedded/embedded_color/embedded_color.dart';
import 'package:tswiri_database/embedded/embedded_icon_data/embedded_icon_data.dart';
part 'container_type.g.dart';

///Specifies details for a specific container type.
///
/// - ```containerTypeName```
/// - ```containerDescription```
/// - ```moveable```
/// - ```enclosing```
/// - ```canContain```
/// - ```preferredChildContainer```
/// - ```containerColor```
/// - ```iconData```
///
@Collection()
@Name("ContainerType")
class ContainerType {
  ///containerTypeID.
  Id id = Isar.autoIncrement;

  ///ContainerUID.
  @Name("containerTypeName")
  late String containerTypeName;

  ///Container Description.
  @Name("containerDescription")
  late String containerDescription;

  ///Can this container be moved.
  @Name("moveable")
  late bool moveable;

  ///Is this container's barcode a marker by defaut.
  @Name("enclosing")
  late bool enclosing; //Rename enclosing

  ///List of containers that this container can contain.
  @Name("canContain")
  late List<int> canContain;

  ///ID of the preferred child container.
  @Name("preferredChildContainer")
  late int preferredChildContainer;

  ///Container color.
  @Name("containerColor")
  late EmbeddedColor containerColor;

  ///Container Icon.
  @Name("iconData")
  late EmbeddedIconData iconData;

  @override
  String toString() {
    return '''-------------------------------------
containerType: $containerTypeName,
containerDescription: $containerDescription,
moveable: $moveable, canContain: $canContain
color: $containerColor
iconData: ${iconData.data}
-------------------------------------\n''';
  }

  //To json.
  Map toJson() => {
        'id': id,
        'containerType': containerTypeName,
        'containerDescription': containerDescription,
        'moveable': moveable,
        'enclosing': enclosing,
        'canContain': canContain,
        'containerColor': containerColor.data,
      };

  //From json.
  ContainerType fromJson(Map<String, dynamic> json) {
    return ContainerType()
      ..id = json['id']
      ..containerTypeName = json['containerType']
      ..containerDescription = json['containerDescription']
      ..enclosing = json['enclosing']
      ..canContain = (json['canContain'] as List<dynamic>).cast<int>()
      ..moveable = json['moveable']
      ..containerColor =
          EmbeddedColor.fromColor(Color(json['containerColor'] as int));
  }
}

// class IconConverter extends TypeConverter<IconData, List<String>> {
//   const IconConverter(); // Converters need to have an empty const constructor

//   @override
//   IconData fromIsar(List<String> object) {
//     return IconData(
//       int.parse(object[0]),
//       fontFamily: object[1],
//     );
//   }

//   @override
//   List<String> toIsar(IconData object) {
//     return [
//       object.codePoint.toString(),
//       object.fontFamily.toString(),
//     ];
//   }
// }

// class ColorConverter extends TypeConverter<Color, String> {
//   const ColorConverter(); // Converters need to have an empty const constructor

//   @override
//   Color fromIsar(String object) {
//     return Color(int.parse(object)).withOpacity(1);
//   }

//   @override
//   String toIsar(Color object) {
//     return object.value.toString();
//   }
// }
