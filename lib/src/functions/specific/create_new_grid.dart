import 'package:tswiri_database/src/collections/export.dart';

///Creates a [CatalogedGrid] with [CatalogedCoordinate]s.
createNewGrid({
  required Isar isar,
  required CatalogedGrid catalogedGrid,
  required CatalogedCoordinate catalogedCoordinate,
}) {
  isar.writeTxnSync(() {
    int id = isar.catalogedGrids.putSync(catalogedGrid);
    isar.catalogedCoordinates.putSync(
      catalogedCoordinate..gridUID = isar.catalogedGrids.getSync(id)!.uid,
    );
  });
}
