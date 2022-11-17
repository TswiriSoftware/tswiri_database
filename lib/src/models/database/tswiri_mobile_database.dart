import 'package:tswiri_database/src/collections/export.dart';
import 'package:tswiri_database/src/functions/specific/create_database_info.dart';
import 'package:tswiri_database/src/initializers/mobile_database.dart';
import 'package:tswiri_database/src/models/database/tswiri_database_object.dart';

class TswiriMobileDatabase extends TswiriDatabaseObject {
  TswiriMobileDatabase({
    required super.directory,
  }) {
    init();
  }

  ///The Database.
  late Isar _isar;

  ///The databaseID.
  late int databaseID;

  ///Initiate the database.
  @override
  init() {
    //Initialize Isar.
    _isar = initialiseMobileDatabase(directory: directory);

    //Check if the db has info stored.
    if (_isar.databaseInfos.countSync() == 0) {
      databaseID = createDatabaseInfo(isar: _isar);
    } else {
      databaseID = _isar.databaseInfos.getSync(0)!.databaseID;
    }
  }

  ///Once called object should be disposed of.
  @override
  Future close() async {
    _isar.close();
  }
}
