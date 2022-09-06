import 'dart:math';

import 'package:isar/isar.dart';

class CornerPointConverter extends TypeConverter<List<Point<int>>, List<int>> {
  const CornerPointConverter(); // Converters need to have an empty const constructor

  @override
  List<Point<int>> fromIsar(List<int> object) {
    return [
      Point(
        object[0],
        object[1],
      ),
      Point(
        object[2],
        object[3],
      ),
      Point(
        object[4],
        object[5],
      ),
      Point(
        object[6],
        object[7],
      ),
    ];
  }

  @override
  List<int> toIsar(List<Point<int>> object) {
    return [
      object[0].x,
      object[0].y,
      object[1].x,
      object[1].y,
      object[2].x,
      object[2].y,
      object[3].x,
      object[3].y,
    ];
  }
}
