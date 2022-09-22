import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tswiri_database/functions/backup/restore_backup.dart';
import 'package:tswiri_database/functions/general/capitalize_first_character.dart';
import 'package:tswiri_database/functions/general/coordinate_translator.dart';
import 'package:tswiri_database/functions/general/distinct_by.dart';
import 'package:tswiri_database/functions/general/recreate_directory.dart';
import 'package:tswiri_database/functions/isar/isar_functions.dart';

void main() {
  group('Backup/Restore functions: ', () {
    Directory thumbnailDirectory = Directory('thumbnails');
    File photoFile = File('photos/16089732478234.jpg');
    String photoName = '16089732478234';

    test('Function: checkIfFileIsZip()', () {
      expect(
        checkIfFileIsZip(File('test/my_file.zip')),
        true,
      );
      expect(
        checkIfFileIsZip(File('test/my_file.z')),
        false,
      );
    });

    test('Function: getUnZippedDirectoryPath()', () {
      expect(
        getUnzippedDirectory(
          Directory('temporaryDirectory'),
          File('my_file.zip'),
        ).path,
        'temporaryDirectory/my_file',
      );
    });

    test('Function: extractPhotoName()', () {
      expect(extractPhotoName(photoFile), '16089732478234');
    });

    test('Function: constructPhotoThumnailPath()', () {
      expect(
        constructPhotoThumnailPath(thumbnailDirectory, photoName),
        'thumbnails/16089732478234_thumbnail.jpg',
      );
    });
  });

  group('Initiate Functions: ', () {
    test('Function: initiateSpaceDirectory()', () async {
      Directory spaceDirectory = await initiateSpaceDirectory();
      expect(spaceDirectory.path,
          '${(await getApplicationSupportDirectory()).path}/main_space');
    });

    test('Function: initiatePhotoStorage()', () async {
      Directory photoDirectory = await initiatePhotoStorage();
      expect(photoDirectory.path,
          '${(await getApplicationSupportDirectory()).path}/main_space/photos');
    });

    test('Function: initiateThumnailStorage()', () async {
      Directory thumbnailDirectory = await initiateThumnailStorage();
      expect(thumbnailDirectory.path,
          '${(await getApplicationSupportDirectory()).path}/main_space/thumbnails');
    });
  });

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

  group('General Functions: ', () {
    test('Function: capitalizeFirstCharacter()', () async {
      double x = translateX(1, InputImageRotation.rotation0deg,
          const Size(720, 1024), const Size(1440, 2048));

      log(x.toString());
      String string = 'test';
      expect(string.capitalizeFirstCharacter(), 'Test');
    });

    test('Function: translateX()', () async {
      double x = translateX(1, InputImageRotation.rotation0deg,
          const Size(720, 1024), const Size(1440, 2048));
      expect(x, 0.5);
    });

    test('Function: translateY()', () async {
      double y = translateY(1, InputImageRotation.rotation0deg,
          const Size(720, 1024), const Size(1440, 2048));
      expect(y, 0.5);
    });

    test('Function: recreateDirectory()', () async {
      Directory testDirectory = Directory(
          '${(await getApplicationSupportDirectory()).path}/new_directory');

      recreateDirectory(testDirectory);

      expect(testDirectory.existsSync(), true);

      testDirectory.deleteSync();
    });

    test('Function: distinctBy()', () async {
      List<String> testList = [
        'test',
        'test',
        'test_1',
        'test_2',
        'test_1',
      ];

      List<String> distinctList = testList.distinctBy((x) => x).toList();

      expect(distinctList, ['test', 'test_1', 'test_2']);
    });
  });
}
