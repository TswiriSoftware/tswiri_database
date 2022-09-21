import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tswiri_database/export.dart';
import 'package:tswiri_database/functions/backup/backup_restore_functions.dart';
import 'package:tswiri_database/functions/backup/restore_backup.dart';
import 'package:tswiri_database/mobile_database.dart';
import 'package:tswiri_database/models/settings/app_settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initiate Isar Storage Directories.
  await initiateIsarDirectory();
  await initiatePhotoStorage();

  //Initiate Isar.
  isar = initiateMobileIsar();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        'title',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      centerTitle: true,
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        children: [
          Card(
            child: ElevatedButton(
              onPressed: () async {
                // File restoreFile = await getFileFromAssets('test_backup.zip');

                // await restoreBackupFunction(
                //   eventCallback: (event) => log(event.toString()),
                //   selectedFilePath: restoreFile.path,
                //   isarDirectoryPath: isarDirectory!.path,
                //   temporaryDirectoryPath: (await getTemporaryDirectory()).path,
                //   photoDirectoryPath: photoDirectory!.path,
                //   isarVersion: '1',
                // );
              },
              child: const Text('Import Database'),
            ),
          ),
        ],
      ),
    );
  }
}

Future<File> getFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}
