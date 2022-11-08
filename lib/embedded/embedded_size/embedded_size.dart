import 'package:isar/isar.dart';
part 'embedded_size.g.dart';

@embedded
class EmbeddedSize {
  List<double>? data;

  EmbeddedSize({this.data});
  EmbeddedSize.fromSize(List<double> size) {
    data = size;
  }

  EmbeddedSize.fromMessage(List<double> message) {
    data = [message[0], message[1]];
  }

  // @Ignore()
  // Size get size {
  //   return Size(data![0], data![1]);
  // }
}
