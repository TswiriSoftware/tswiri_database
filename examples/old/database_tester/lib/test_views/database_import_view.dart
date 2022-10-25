import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tswiri_database/export.dart';
import 'package:tswiri_database/functions/backup/restore_backup.dart';
import 'package:tswiri_database/test_functions/get_file_from_assets.dart';

class DatabaseImportView extends StatefulWidget {
  const DatabaseImportView({Key? key}) : super(key: key);

  @override
  State<DatabaseImportView> createState() => _DatabaseImportViewState();
}

class _DatabaseImportViewState extends State<DatabaseImportView> {
  bool hasImported = false;

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
        'import_test',
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
            key: const Key('import_file'),
            onPressed: () async {
              File restoreFile = await getFileFromAssets('test_file_V1.zip');

              // await restoreBackupFunction(
              //   eventCallback: (event) => log(event.toString()),
              //   selectedFilePath: restoreFile.path,
              //   isarDirectoryPath: spaceDirectory!.path,
              //   temporaryDirectoryPath: (await getTemporaryDirectory()).path,
              //   photoDirectoryPath: photoDirectory!.path,
              //   thumbnailDirectoryPath: thumbnailDirectory!.path,
              //   isarVersion: '1',
              // );

              await restoreBackupZipFileV1(
                spacePath: spaceDirectory!.path,
                temporaryDirectoryPath: (await getTemporaryDirectory()).path,
                selectedFilePath: restoreFile.path,
                isarVersion: '1',
                eventCallback: (event) => log(event.toString()),
              );

              setState(() {
                hasImported = true;
              });
            },
            child: const Text('import_file'),
          ),
          Text(
            hasImported.toString(),
            key: const Key('hasImported'),
          ),
          Text(
            isar!.catalogedBarcodes.where().findAllSync().length.toString(),
            key: const Key('catalogedBarcodes'),
          ),
          Text(
            isar!.catalogedContainers.where().findAllSync().length.toString(),
            key: const Key('catalogedContainers'),
          ),
          Text(
            isar!.catalogedCoordinates.where().findAllSync().length.toString(),
            key: const Key('catalogedCoordinates'),
          ),
          Text(
            isar!.catalogedGrids.where().findAllSync().length.toString(),
            key: const Key('catalogedGrids'),
          ),
          Text(
            isar!.barcodeBatchs.where().findAllSync().length.toString(),
            key: const Key('barcodeBatchs'),
          ),
          Text(
            isar!.containerRelationships
                .where()
                .findAllSync()
                .length
                .toString(),
            key: const Key('containerRelationships'),
          ),
          Text(
            isar!.containerTags.where().findAllSync().length.toString(),
            key: const Key('containerTags'),
          ),
          Text(
            isar!.containerTypes.where().findAllSync().length.toString(),
            key: const Key('containerTypes'),
          ),
        ],
      ),
    );
  }
}
