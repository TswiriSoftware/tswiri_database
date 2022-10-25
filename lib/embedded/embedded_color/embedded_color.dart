import 'dart:ui';

import 'package:isar/isar.dart';
part 'embedded_color.g.dart';

@embedded
class EmbeddedColor {
  String? data;

  EmbeddedColor({this.data});
  EmbeddedColor.fromColor(Color color) {
    data = color.value.toString();
  }

  @Ignore()
  Color get color {
    return Color(int.parse(data!)).withOpacity(1);
  }
}
