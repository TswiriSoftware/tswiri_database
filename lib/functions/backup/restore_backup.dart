// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'dart:developer';
import 'package:archive/archive_io.dart';
import 'dart:io';
import 'dart:isolate';

// import 'package:flutter_archive/flutter_archive.dart';
import 'package:image/image.dart' as img;

///Restores a backup zip file.
Future<void> restoreBackup(List init) async {
  //1. InitalMessage.
  SendPort sendPort = init[0]; //[0] SendPort.
  String isarDirectoryPath = init[1]; //[1] Isar Directory.
  String temporaryDirectoryPath = init[2]; //[2] Backup folder.
  String isarVersion = init[3]; //[3] isarVersion.
  String photoDirectoryPath = init[4]; //[4] photoDirectory.
  String selectedFilePath = init[5]; //[5] selectedFilePath.

  await restoreBackupFunction(
    isarDirectoryPath: isarDirectoryPath,
    temporaryDirectoryPath: temporaryDirectoryPath,
    photoDirectoryPath: photoDirectoryPath,
    selectedFilePath: selectedFilePath,
    isarVersion: isarVersion,
    eventCallback: (event) {
      sendPort.send(event);
    },
  );
}

Future<void> restoreBackupFunction({
  required String isarDirectoryPath,
  required String temporaryDirectoryPath,
  required String photoDirectoryPath,
  required String selectedFilePath,
  required String isarVersion,
  required Function(List<String> event) eventCallback,
}) async {
  //2. Check if database versions match.
  File restoreFile = File(selectedFilePath);

  if (restoreFile.path.split('/').last.split('.').last == 'zip') {
    //Unzip selectedfile.
    Directory temporaryDirectory = Directory(temporaryDirectoryPath);

    //UnzippedDirectory.
    Directory unzippedDirectory = Directory(
        '${temporaryDirectory.path}/${restoreFile.path.split('/').last.split('.').first}');

    if (unzippedDirectory.existsSync()) {
      unzippedDirectory.deleteSync(recursive: true);
      unzippedDirectory.createSync();
    } else {
      unzippedDirectory.create();
    }

    final zipFile = restoreFile;
    final destinationDir = unzippedDirectory;
    try {
      eventCallback([
        'progress',
        'Unzipping',
      ]);

      final inputStream = InputFileStream(zipFile.path);
      final archive = ZipDecoder().decodeBuffer(inputStream);
      extractArchiveToDisk(archive, destinationDir.path);

      eventCallback([
        'progress',
        'Done',
      ]);
    } catch (e) {
      log(e.toString());
    }

    File restoreDAT = File('${unzippedDirectory.path}/isar/mdbx.dat');
    File restorelLCK = File('${unzippedDirectory.path}/isar/mdbx.lck');

    if (restoreDAT.existsSync() && restorelLCK.existsSync()) {
      eventCallback([
        'progress',
        'Restoring: 0.0%',
      ]);

      Directory isarDataFolder = Directory(isarDirectoryPath);

      Directory photoDirectory = Directory(photoDirectoryPath);

      //Delete these files.
      File('${isarDataFolder.path}/isar/mdbx.dat').deleteSync();
      File('${isarDataFolder.path}/isar/mdbx.lck').deleteSync();

      //Copy restored Files over
      restoreDAT.copySync('${isarDataFolder.path}/isar/mdbx.dat');
      restorelLCK.copySync('${isarDataFolder.path}/isar/mdbx.lck');

      //Delete all photo files.
      photoDirectory.deleteSync(recursive: true);
      photoDirectory = await photoDirectory.create();

      //Unzipped Photos.
      Directory unzippedPhotos = Directory('${unzippedDirectory.path}/photos');

      var files = unzippedPhotos.listSync(recursive: true, followLinks: false);

      int numberOfFiles = files.length + 2;
      int x = 2;

      eventCallback([
        'progress',
        'Restoring: ${((x / numberOfFiles) * 100).toStringAsFixed(2)}%',
      ]);

      //Restore Photos and thumbnails.
      for (var file in files) {
        File photoFile = File(file.path);

        String photoName = photoFile.path.split('/').last.split('.').first;

        photoFile.copySync(
            '${photoDirectory.path}/${photoFile.path.split('/').last}');
        String photoThumbnailPath =
            '${photoDirectory.path}/${photoName}_thumbnail.jpg';
        img.Image referenceImage =
            img.decodeImage(photoFile.readAsBytesSync())!;
        img.Image thumbnailImage = img.copyResize(referenceImage, width: 240);
        File(photoThumbnailPath)
            .writeAsBytesSync(img.encodeJpg(thumbnailImage));

        x++;

        eventCallback([
          'progress',
          'Restoring: ${((x / numberOfFiles) * 100).toStringAsFixed(2)}%',
        ]);
      }

      eventCallback([
        'progress',
        'Deleting old files.',
      ]);

      unzippedDirectory.deleteSync(recursive: true);

      eventCallback([
        'done',
      ]);
    } else {
      eventCallback([
        'error',
        'file_error',
      ]);
    }
  } else {
    eventCallback([
      'error',
      'file_error',
    ]);
  }
}
