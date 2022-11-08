import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
part 'embedded_icon_data.g.dart';

@embedded
class EmbeddedIconData {
  // IconData? iconData;
  List<String>? data;

  EmbeddedIconData({this.data});
  EmbeddedIconData.fromIconData(List<String> iconData) {
    data = iconData;
  }

  // @Ignore()
  // IconData? get iconData {
  //   return IconData(
  //     int.parse(data![0]),
  //     fontFamily: data![1],
  //   );
  // }
}
