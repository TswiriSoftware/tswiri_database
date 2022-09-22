import 'dart:developer';
import 'dart:io';

import 'package:database_tester/test_views/database_export_view.dart';
import 'package:database_tester/test_views/database_import_view.dart';
import 'package:flutter/material.dart';
import 'package:tswiri_database/export.dart';
import 'package:tswiri_database/mobile_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initiate Isar Storage Directories.
  await initiateSpaceDirectory();
  await initiatePhotoStorage();
  await initiateThumnailStorage();

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
      child: GridView.count(
        crossAxisCount: 10,
        children: [
          Card(
            child: ElevatedButton(
              key: const Key('import_test'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DatabaseImportView(),
                  ),
                );
              },
              child: const Text('import_test'),
            ),
          ),
          Card(
            child: ElevatedButton(
              key: const Key('export_test'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DatabaseExportView(),
                  ),
                );
              },
              child: const Text('export_test'),
            ),
          ),
        ],
      ),
    );
  }
}

// Card(
//   child: ElevatedButton(
//     onPressed: () async {
      // File restoreFile = await getFileFromAssets('test_backup.zip');
      // await restoreBackupFunction(
      //   eventCallback: (event) => log(event.toString()),
      //   selectedFilePath: restoreFile.path,
      //   isarDirectoryPath: isarDirectory!.path,
      //   temporaryDirectoryPath: (await getTemporaryDirectory()).path,
      //   photoDirectoryPath: photoDirectory!.path,
      //   isarVersion: '1',
      // );
//     },
//     child: const Text('Import Database'),
//   ),
// ),
// Card(
//   child: ElevatedButton(
//     onPressed: () async {
//       File? file = await createBackupFunction(
//           isarDirectoryPath: isarDirectory!.path,
//           temporaryDirectoryPath:
//               (await getApplicationSupportDirectory()).path,
//           photoDirectoryPath: photoDirectory!.path,
//           isarVersion: '1',
//           fileName: 'backup',
//           eventCallback: (event) => log(
//                 event.toString(),
//               ),
//           isar: isar!);

//       if (file != null) {
//         await file.create();
//       }

//       log(file?.path ?? 'error dunno', name: 'Zip File Path');
//     },
//     child: const Text('Export Database'),
//   ),
// ),
