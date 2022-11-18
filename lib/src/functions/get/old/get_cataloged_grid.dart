import 'package:tswiri_database/src/collections/export.dart';

///default: Returns a list of all [CatalogedGrid].
List<CatalogedGrid> getCatalogedGridsSync({
  required Isar isar,
}) {
  return isar.catalogedGrids.where().findAllSync();
}

///default: Returns null.
///
///id: Returns a [CatalogedGrid] matching id.
///
CatalogedGrid? getCatalogedGridSync({
  required Isar isar,
  int? gridUID,
}) {
  if (gridUID != null) {
    return isar.catalogedGrids.getSync(gridUID);
  }

  return null;
}
