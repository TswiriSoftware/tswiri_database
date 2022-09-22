import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tswiri_database/export.dart';
import 'package:tswiri_database/functions/backup/create_backup.dart';

class DatabaseExportView extends StatefulWidget {
  const DatabaseExportView({Key? key}) : super(key: key);

  @override
  State<DatabaseExportView> createState() => _DatabaseExportViewState();
}

class _DatabaseExportViewState extends State<DatabaseExportView> {
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
        'export_test',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      centerTitle: true,
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await createBackupZipFile(
                  spacePath: spaceDirectory!.path,
                  outputFileName: 'test_file',
                  temporaryDirectoryPath:
                      (await getApplicationSupportDirectory()).path,
                  isarVersion: '1',
                  eventCallback: (event) {
                    log(event.toString());
                  });
            },
            child: const Text('data'),
          ),
        ],
      ),
    );
  }
}
