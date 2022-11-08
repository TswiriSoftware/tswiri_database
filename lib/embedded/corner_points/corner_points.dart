import 'dart:math';
import 'package:isar/isar.dart';
part 'corner_points.g.dart';

@embedded
class CornerPoints {
  List<int>? data;

  CornerPoints({this.data});
  CornerPoints.fromCornerPoints(List<Point<int>> cornerPoints) {
    data = [
      cornerPoints[0].x,
      cornerPoints[0].y,
      cornerPoints[1].x,
      cornerPoints[1].y,
      cornerPoints[2].x,
      cornerPoints[2].y,
      cornerPoints[3].x,
      cornerPoints[3].y,
    ];
  }

  CornerPoints.fromMessage(List<int> message) {
    data = message;
  }

  // @Ignore()
  // Rect get getBoundingBox {
  //   return Rect.fromPoints(
  //     Offset(data![0].toDouble(), data![1].toDouble()),
  //     Offset(data![4].toDouble(), data![5].toDouble()),
  //   );
  // }

  @Ignore()
  List<Point<int>> get cp {
    return [
      Point(data![0], data![1]),
      Point(data![2], data![3]),
      Point(data![4], data![5]),
      Point(data![6], data![7]),
    ];
  }
}
