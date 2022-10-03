// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter_archive/flutter_archive.dart';
import 'package:image/image.dart' as img;

///Restores a backup zip file.
@pragma('vm:entry-point')
Future<void> restoreBackup(List init) async {
  //1. InitalMessage.
  SendPort sendPort = init[0]; //[0] SendPort.
  String isarDirectory = init[1]; //[1] Isar Directory.
  String temporaryDirectoryPath = init[2]; //[2] Backup folder.
  String isarVersion = init[3]; //[3] isarVersion.
  String photoDirectoryPath = init[4]; //[4] photoDirectory.
  String selectedFilePath = init[5]; //[5] selectedFilePath.

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
      sendPort.send([
        'progress',
        'Unzipping',
      ]);

      await ZipFile.extractToDirectory(
        zipFile: zipFile,
        destinationDir: destinationDir,
        onExtracting: (zipEntry, progress) {
          sendPort.send([
            'progress',
            'Unzipping: ${progress.toStringAsFixed(2)}%',
          ]);
          return ZipFileOperation.includeItem;
        },
      );

      sendPort.send([
        'progress',
        'Done',
      ]);
    } catch (e) {
      log(e.toString());
    }

    File restoreDAT = File('${unzippedDirectory.path}/isar/mdbx.dat');
    File restorelLCK = File('${unzippedDirectory.path}/isar/mdbx.lck');

    if (restoreDAT.existsSync() && restorelLCK.existsSync()) {
      sendPort.send([
        'progress',
        'Restoring: 0.0%',
      ]);

      Directory isarDataFolder = Directory(isarDirectory);

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
      sendPort.send([
        'progress',
        'Restoring: ${((x / numberOfFiles) * 100).toStringAsFixed(2)}%',
      ]);

      //Restore Photos and thumbnails.
      for (var file in files) {
        File photoFile = File(file.path);

        // img.Image image = img.decodeImage(photoFile.readAsBytesSync())!;
        // img.Image hdImage = img.copyResize(image, width: 720);

        String photoName = photoFile.path.split('/').last.split('.').first;

        photoFile.copySync(
            '${photoDirectory.path}/${photoFile.path.split('/').last}');

        ///Copy the fullsize image.
        // File('${photoDirectory.path}/$photoName.jpg')
        //     .writeAsBytesSync(img.encodeJpg(hdImage));

        String photoThumbnailPath =
            '${photoDirectory.path}/${photoName}_thumbnail.jpg';
        img.Image referenceImage =
            img.decodeImage(photoFile.readAsBytesSync())!;
        img.Image thumbnailImage = img.copyResize(referenceImage, width: 240);
        File(photoThumbnailPath)
            .writeAsBytesSync(img.encodeJpg(thumbnailImage));

        x++;
        sendPort.send([
          'progress',
          'Restoring: ${((x / numberOfFiles) * 100).toStringAsFixed(2)}%',
        ]);
      }

      sendPort.send([
        'Deleting old files.',
      ]);

      unzippedDirectory.deleteSync(recursive: true);

      sendPort.send([
        'done',
      ]);
    } else {
      sendPort.send([
        'error',
        'file_error',
      ]);
    }
  } else {
    sendPort.send([
      'error',
      'file_error',
    ]);
  }
}
