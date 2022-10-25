import 'package:isar/isar.dart';
import 'package:vector_math/vector_math_64.dart' as vm;
part 'embedded_vector_3.g.dart';

@embedded
class EmbeddedVector3 {
  List<double>? data;

  EmbeddedVector3({this.data});
  EmbeddedVector3.fromVector(vm.Vector3 vector) {
    data = [vector.x, vector.y, vector.z];
  }

  EmbeddedVector3.fromMessage(List<double> message) {
    data = message;
  }

  @Ignore()
  vm.Vector3 get vector {
    return vm.Vector3(data![0], data![1], data![2]);
  }
}
