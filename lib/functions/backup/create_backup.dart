import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'package:intl/intl.dart';
import 'package:tswiri_database/export.dart';
import 'package:tswiri_database/mobile_database.dart';
import 'package:archive/archive_io.dart';

Future<void> createBackup(List init) async {
  //1. InitalMessage.
  SendPort sendPort = init[0]; //[0] SendPort.
  String isarDirectoryPath = init[1]; //[1] Isar Directory.
  String outputDirectoryPath = init[2]; //[2] Backup folder.
  String isarVersion = init[3]; //[3] isarVersion.
  String photoDirectoryPath = init[4]; //[4] photoDirectory.
  String fileName = init[5]; //[5] fileName.

  // log(isarDirectory, name: 'Isar Directory');
  // log(photoDirectory, name: 'Photo Directory');

  sendPort.send([
    'progress',
    'Starting',
  ]);

  //2. Initiate isar.
  Isar isar =
      initiateMobileIsar(directory: isarDirectoryPath, inspector: false);

  await createBackupFunction(
    isarDirectoryPath: isarDirectoryPath,
    temporaryDirectoryPath: outputDirectoryPath,
    photoDirectoryPath: photoDirectoryPath,
    isarVersion: isarVersion,
    fileName: fileName,
    eventCallback: (event) {
      sendPort.send(event);
    },
    isar: isar,
  );
}

Future<File?> createBackupFunction({
  required String isarDirectoryPath,
  required String temporaryDirectoryPath,
  required String photoDirectoryPath,
  required String isarVersion,
  required String fileName,
  required Function(List<String> event) eventCallback,
  required Isar isar,
}) async {
  var completer = Completer<File?>();

  eventCallback([
    'progress',
    'Starting',
  ]);

  //3. Isar Data Folder.
  Directory isarDataFolder = Directory('$isarDirectoryPath/isar');

  //4. Backup Directory.
  Directory backupDirectory = Directory('$temporaryDirectoryPath/backups/');
  if (!backupDirectory.existsSync()) {
    backupDirectory.create(recursive: true);
  }

  //5. Get the current Date and Time.
  String formattedDate = DateFormat('yyyy_MM_dd_HH_mm').format(DateTime.now());

  //6. Create backup directory.
  Directory newBackupDirectory =
      Directory('${backupDirectory.path}backup_$formattedDate');

  // log(newBackupDirectory.path, name: 'Backup Directory');

  if (!newBackupDirectory.existsSync()) {
    newBackupDirectory.createSync(recursive: true);
  } else {
    newBackupDirectory.deleteSync(recursive: true);
    newBackupDirectory.createSync(recursive: true);
  }

  //7. Create the photo backup Directory.
  String newBackupPath = '${newBackupDirectory.path}/';

  Directory newBackupPhotos = Directory('${newBackupPath}photos');
  if (!newBackupPhotos.existsSync()) {
    newBackupPhotos.createSync(recursive: true);
  } else {
    newBackupPhotos.deleteSync(recursive: true);
    newBackupPhotos.createSync(recursive: true);
  }

  // log(newBackupPhotos.path, name: 'Photo Backup Directory');

  String newBackupPhotosPath = '${newBackupPhotos.path}/';

  //8. Copy over all photos to new directory.
  List<Photo> photos = isar.photos.where().findAllSync();

  eventCallback([
    'progress',
    'Creating: 0.0%',
  ]);

  int files = photos.length + 2;
  int x = 0;

  for (var photo in photos) {
    eventCallback([
      'progress',
      'Creating: ${((x / files) * 100).toStringAsFixed(2)}%',
    ]);

    File photoFile = File(photo.getPhotoPath(directory: photoDirectoryPath));

    photoFile
        .copySync('$newBackupPhotosPath${photo.photoName}.${photo.extention}');

    x++;
  }

  final folder = isarDataFolder.listSync(recursive: true, followLinks: false);
  Directory isarBackupDirectory = Directory('${newBackupPath}isar/');
  if (!isarBackupDirectory.existsSync()) {
    isarBackupDirectory.createSync(recursive: true);
  } else {
    isarBackupDirectory.deleteSync();
    isarBackupDirectory.create(recursive: true);
  }

  for (var file in folder) {
    File isarFile = File(file.path);
    isarFile.copySync(isarBackupDirectory.path + isarFile.path.split('/').last);
    x++;

    eventCallback([
      'progress',
      'Creating: ${((x / files) * 100).toStringAsFixed(2)}%',
    ]);
  }

  try {
    eventCallback([
      'progress',
      'Compressing',
    ]);

    var encoder = ZipFileEncoder();
    encoder.create('$temporaryDirectoryPath/${fileName}_$isarVersion.zip');
    encoder.addDirectory(Directory('$isarDirectoryPath/isar'));
    encoder.addDirectory(Directory('$isarDirectoryPath/photos'));
    encoder.close();

    eventCallback([
      'path',
      '$temporaryDirectoryPath/${fileName}_$isarVersion.zip',
    ]);

    completer
        .complete(File('$temporaryDirectoryPath/${fileName}_$isarVersion.zip'));
  } catch (e) {
    // log(e.toString());
  }

  eventCallback([
    'done',
  ]);

  return completer.future;
}
