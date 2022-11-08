import 'package:isar/isar.dart';
part 'embedded_color.g.dart';

@embedded
class EmbeddedColor {
  String? data;

  EmbeddedColor({this.data});
  EmbeddedColor.fromColor(String color) {
    data = color;
  }

  // @Ignore()
  // Color get color {
  //   return Color(int.parse(data!)).withOpacity(1);
  // }
}
