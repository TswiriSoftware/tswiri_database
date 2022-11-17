import 'package:tswiri_database/src/collections/export.dart';

///Updates/Creates [CatalogedCoordinate]'s.
updateCoordinates({
  required Isar isar,
  required String gridUID,
  required List<CatalogedCoordinate> coordinates,
}) {
  isar.writeTxnSync(() {
    isar.catalogedCoordinates.filter().gridUIDEqualTo(gridUID).deleteAllSync();

    isar.catalogedCoordinates.putAllSync(coordinates);
  });
}
