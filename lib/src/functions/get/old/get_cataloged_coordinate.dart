// import 'package:tswiri_database/src/collections/export.dart';

// ///default: Returns a list of all [CatalogedCoordinate].
// ///
// ///gridUID: Returns a list of [CatalogedCoordinate] matching gridUID.
// ///
// List<CatalogedCoordinate> getCatalogedCoordinatesSync({
//   required Isar isar,
//   int? gridUID,
// }) {
//   if (gridUID != null) {
//     return isar.catalogedCoordinates
//         .filter()
//         .gridUIDEqualTo(gridUID)
//         .findAllSync();
//   }
//   return isar.catalogedCoordinates.where().findAllSync();
// }

// CatalogedCoordinate? getCatalogedCoordinate({
//   required Isar isar,
//   String? barcodeUID,
// }) {
//   if (barcodeUID != null) {
//     return isar.catalogedCoordinates
//         .filter()
//         .barcodeUIDMatches(barcodeUID)
//         .findFirstSync();
//   }
//   return null;
// }
