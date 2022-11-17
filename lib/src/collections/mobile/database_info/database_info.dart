import 'package:isar/isar.dart';
part 'database_info.g.dart';

///[DatabaseInfo]
///
/// - `databaseID` uid of `this` database.
/// - `deviceID` the id of `this` device.
///
@Collection()
@Name("DatabaseInfo")
class DatabaseInfo {
  Id id = Isar.autoIncrement;

  @Name('databaseID')
  late int databaseID;

  @Name('deviceID')
  late String deviceID;
}
