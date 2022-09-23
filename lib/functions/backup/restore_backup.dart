// ignore_for_file: depend_on_referenced_packages, unused_local_variable
import 'package:archive/archive_io.dart';
import 'dart:io';
import 'dart:isolate';
import 'package:image/image.dart' as img;
import 'package:tswiri_database/functions/general/recreate_directory.dart';

///Restores a backup zip file.
Future<void> restoreBackupIsolate(List init) async {
  //1. InitalMessage.
  SendPort sendPort = init[0]; //[0] SendPort.
  String spacePath = init[1]; //[1] Isar Directory.
  String temporaryDirectoryPath = init[2]; //[2] Backup folder.
  String isarVersion = init[3]; //[3] isarVersion.
  String selectedFilePath = init[4]; //[5] selectedFilePath.

  await restoreBackupZipFile(
    spacePath: spacePath,
    temporaryDirectoryPath: temporaryDirectoryPath,
    selectedFilePath: selectedFilePath,
    isarVersion: isarVersion,
    eventCallback: (event) {
      sendPort.send(event);
    },
  );
}

Future<void> restoreBackupZipFile({
  required String spacePath,
  required String temporaryDirectoryPath,
  required String selectedFilePath,
  required String isarVersion,
  required Function(List<String> event) eventCallback,
}) async {
  File zipFile = File(selectedFilePath);
  Directory temporaryDirectory = Directory(temporaryDirectoryPath);
  Directory destinationDir = getUnzippedDirectory(temporaryDirectory, zipFile);

  ///Create if the unzippedDirectory or recreate it if it exists.
  recreateDirectory(destinationDir);

  if (checkIfFileIsZip(zipFile)) {
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

    File mdbxDAT = File('${destinationDir.path}/isar/mdbx.dat');
    File mdbxLCK = File('${destinationDir.path}/isar/mdbx.lck');

    //Check if mdbx.dat and mdbx.lck exists.
    if (mdbxDAT.existsSync() && mdbxLCK.existsSync()) {
      eventCallback([
        'progress',
        'Restoring database',
      ]);

      Directory isarCoreDirectory = Directory('$spacePath/isar');
      Directory photoDirectory = Directory('$spacePath/photos');
      Directory thumbnailDirectory = Directory('$spacePath/thumbnails');

      //Delete mdbx.dat and mdbx.lck.
      File('${isarCoreDirectory.path}/mdbx.dat').deleteSync();
      File('${isarCoreDirectory.path}/mdbx.lck').deleteSync();

      //Restore mdbx.dat and mdbx.lck.
      mdbxDAT.copySync('${isarCoreDirectory.path}/mdbx.dat');
      mdbxLCK.copySync('${isarCoreDirectory.path}/mdbx.lck');

      //Delete all photo files.
      photoDirectory.deleteSync(recursive: true);
      photoDirectory = await photoDirectory.create(recursive: true);
      thumbnailDirectory = await thumbnailDirectory.create(recursive: true);

      //Unzipped Photos.
      Directory unzippedPhotos = Directory('${destinationDir.path}/photos');

      //List of all the photos.
      List<FileSystemEntity> photoFiles =
          unzippedPhotos.listSync(recursive: true, followLinks: false);

      int numberOfFiles = photoFiles.length + 2;
      int x = 2;

      eventCallback([
        'progress',
        'Restoring Photos',
      ]);

      //Restore Photos and thumbnails.
      for (var photo in photoFiles) {
        File photoFile = File(photo.path);

        String photoName = extractPhotoName(photoFile);

        photoFile.copySync(
            '${photoDirectory.path}/${photoFile.path.split('/').last}');

        String photoThumbnailPath =
            constructPhotoThumnailPath(thumbnailDirectory, photoName);

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

      destinationDir.deleteSync(recursive: true);

      eventCallback([
        'done',
      ]);
    }
  } else {
    //Is not a Zip file.
    eventCallback([
      'error',
      'file_error',
    ]);
  }
}

///Get the unzipped directory.
Directory getUnzippedDirectory(
    Directory temporaryDirectory, File fileToRestore) {
  return Directory(
      '${temporaryDirectory.path}/${fileToRestore.path.split('/').last.split('.').first}');
}

///Checks if file is a zip file.
bool checkIfFileIsZip(File restoreFile) =>
    restoreFile.path.split('/').last.split('.').last == 'zip';

///Extract photo name.
String extractPhotoName(File photoFile) =>
    photoFile.path.split('/').last.split('.').first;

///Construct photo tumbnai path.
String constructPhotoThumnailPath(
        Directory thumbnailDirectory, String photoName) =>
    '${thumbnailDirectory.path}/${photoName}_thumbnail.jpg';
