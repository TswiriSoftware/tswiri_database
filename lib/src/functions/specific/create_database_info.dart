import 'package:tswiri_database/src/collections/export.dart';
import 'package:tswiri_database/src/functions/general/generate_device_id.dart';

int createDatabaseInfo({
  required Isar isar,
}) {
  DatabaseInfo databaseInfo = DatabaseInfo()
    ..databaseID = 0
    ..deviceID = generateDeviceUID();

  isar.writeTxnSync(() => isar.databaseInfos.putSync(databaseInfo));

  return databaseInfo.databaseID;
}
