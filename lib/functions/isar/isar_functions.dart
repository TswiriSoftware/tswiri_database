import 'dart:io';
import 'package:tswiri_database/export.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tswiri_database/mobile_database.dart';

///Sets the appIsarDirectory.
///This is the directory where the isar database file's can be found.
Future<void> initiateIsarDirectory() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  ///Get the last storage path used.
  String? storagePath = prefs.getString(isarDirectoryPref);

  ///If it is a fresh install set the storage path to /main_space.
  if (storagePath == null) {
    storagePath = '${(await getApplicationSupportDirectory()).path}/main_space';
    prefs.setString(isarDirectoryPref, storagePath);
  }

  ///Check if the storage path exisits, if not create it.
  if (!await Directory(storagePath).exists()) {
    isarDirectory = await Directory(storagePath).create();
  } else {
    isarDirectory = Directory(storagePath);
  }
}

///Sets the appPhotoDirectory.
///This is the directory where photo's from the isarDatabase is stored.
Future<void> initiatePhotoStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  //Get the latest storage path used.
  String storagePath = '${prefs.getString(isarDirectoryPref)!}/photos';

  //Create directory if it doesnt exist.
  if (!await Directory(storagePath).exists()) {
    photoDirectory = await Directory(storagePath).create();
  } else {
    photoDirectory = Directory(storagePath);
  }
}

///Swap the isar database to the specified directory.
Future<void> swapSpace(Directory directory) async {
  //Set prefs.
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(isarDirectoryPref, directory.path);

  //Close isar connection.
  await isar!.close();

  //Update the isarDirectory.
  isarDirectory = directory;

  //Wait a couple millis.
  await Future.delayed(const Duration(milliseconds: 200));

  //Initiate the isar connection again
  isar = initiateMobileIsar(directory: isarDirectory!.path, inspector: false);
}

///Create a new swap space.
Future<bool> createNewSpace(String spaceName) async {
  String storagePath =
      '${(await getApplicationSupportDirectory()).path}/${spaceName}_space';

  if (!await Directory(storagePath).exists()) {
    await Directory(storagePath).create();

    ///Return true on success.
    return true;
  } else {
    return false;
  }
}

///Get the spaces on this device.
Future<List<String>> getSpacesOnDevice() async {
  List<String> existingSpaces = [];
  Directory directory = (await getApplicationSupportDirectory());
  for (var element in directory.listSync()) {
    if (element is Directory) {
      existingSpaces.add(element.path.split('/').last);
    }
  }
  return existingSpaces;
}
