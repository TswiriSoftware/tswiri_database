import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tswiri_database/functions/isar/isar_functions.dart';

void main() {
  group('Space Functions: ', () {
    String newSpaceName = 'new';

    test('Functions: createNewSpace()', () async {
      Directory spaceDirectory = Directory(
          '${(await getApplicationSupportDirectory()).path}/${newSpaceName}_space');

      if (spaceDirectory.existsSync()) {
        spaceDirectory.deleteSync();
      }

      bool hasCreatedSpace = await createNewSpace(newSpaceName);
      expect(hasCreatedSpace, true);
    });

    test('Functions: getApplicationSupportDirectory()', () async {
      Directory spaceDirectory = Directory(
          '${(await getApplicationSupportDirectory()).path}/${newSpaceName}_space');

      if (spaceDirectory.existsSync()) {
        spaceDirectory.deleteSync();
      }

      List<String> spaces = await getSpacesOnDevice();
      expect(spaces, ['backups', 'main_space']);
    });

    test('Functions: createNewSpace() and getSpacesOnDevice()', () async {
      Directory spaceDirectory = Directory(
          '${(await getApplicationSupportDirectory()).path}/${newSpaceName}_space');

      if (spaceDirectory.existsSync()) {
        spaceDirectory.deleteSync();
      }

      bool hasCreatedSpace = await createNewSpace(newSpaceName);
      expect(hasCreatedSpace, true);

      List<String> spaces = await getSpacesOnDevice();
      expect(spaces, ['new_space', 'backups', 'main_space']);
    });
  });
}
