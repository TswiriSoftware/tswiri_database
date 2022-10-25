import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tswiri_database/desktop_database.dart';
import 'package:tswiri_database/export.dart';
import 'package:tswiri_database/functions/backup/restore_backup.dart';

class BackupView extends StatefulWidget {
  const BackupView({super.key});

  @override
  State<BackupView> createState() => _BackupViewState();
}

class _BackupViewState extends State<BackupView> {
  File? selectedFile;
  bool isBusy = false;
  String currentEvent = '';

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
        'Backup',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      centerTitle: true,
    );
  }

  Widget _body() {
    if (isBusy) {
      return Center(
        child: Column(
          children: [
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  Text(currentEvent),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Column(
          children: [
            _restoreBackup(),
          ],
        ),
      );
    }
  }

  Widget _restoreBackup() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                selectedFile == null
                    ? 'Select File'
                    : selectedFile!.path.split('/').last,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    selectedFile = File(result.files.single.path!);
                  } else {
                    // User canceled the picker
                  }
                  setState(() {});
                },
                child: Text(
                  'Select',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            const Divider(),
            Visibility(
              visible: !isBusy,
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isBusy = true;
                  });
                  //Close isar.
                  await isar!.close();

                  //Restore backup.
                  await restoreBackupZipFileV1(
                    spacePath: spaceDirectory!.path,
                    temporaryDirectoryPath:
                        (await getTemporaryDirectory()).path,
                    selectedFilePath: selectedFile!.path,
                    isarVersion: '1',
                    eventCallback: (event) {
                      setState(() {
                        if (event[0] == 'progress') {
                          currentEvent = event[1];
                        }
                        log(event.toString());
                      });
                    },
                  );

                  //Open isar.
                  isar = initiateDesktopIsar();

                  setState(() {
                    isBusy = false;
                  });
                },
                child: Text(
                  'Restore',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
