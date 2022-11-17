import 'package:tswiri_database/src/collections/export.dart';

///Deletes a [CatalogedGrid] and all [CatalogedCoordinate]s.
deleteGrid({
  required Isar isar,
  required CatalogedGrid catalogedGrid,
}) {
  isar.writeTxnSync(() {
    isar.catalogedGrids.deleteSync(catalogedGrid.id);
    isar.catalogedCoordinates
        .filter()
        .gridUIDEqualTo(catalogedGrid.uid)
        .deleteAllSync();
  });
}
