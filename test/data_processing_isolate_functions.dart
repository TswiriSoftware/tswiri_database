import 'package:flutter_test/flutter_test.dart';
import 'package:tswiri_database/collections/cataloged_coordinate/cataloged_coordinate.dart';
import 'package:tswiri_database/functions/data/data_processing_isolates.dart';
import 'package:vector_math/vector_math_64.dart' as vm;

void main() {
  group('Data Processing Isolate Functions: ', () {
    test('Function: hasMoved()', () async {
      CatalogedCoordinate storedCoordinate = CatalogedCoordinate()
        ..barcodeUID = 'test'
        ..coordinate = vm.Vector3(0, 0, 0)
        ..gridUID = 1
        ..id = 1
        ..rotation = vm.Vector3(0, 0, 0)
        ..timestamp = 123;

      CatalogedCoordinate newCoordinate = CatalogedCoordinate()
        ..barcodeUID = 'test'
        ..coordinate = vm.Vector3(0, 0, 0)
        ..gridUID = 1
        ..id = 1
        ..rotation = vm.Vector3(0, 0, 0)
        ..timestamp = 123;

      bool moved = hasMoved(newCoordinate, storedCoordinate, 5);

      expect(moved, false);

      newCoordinate = CatalogedCoordinate()
        ..barcodeUID = 'test'
        ..coordinate = vm.Vector3(0, 10, 0)
        ..gridUID = 1
        ..id = 1
        ..rotation = vm.Vector3(0, 0, 0)
        ..timestamp = 123;

      moved = hasMoved(newCoordinate, storedCoordinate, 5);

      expect(moved, true);
    });
  });
}
