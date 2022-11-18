// import 'package:tswiri_database/src/collections/export.dart';

// ///default: Returns a list of all [CatalogedBarcode].
// ///
// ///batchID: Returns a list of [CatalogedBarcode] matching batchID.
// ///
// List<CatalogedBarcode> getCatalogedBarcodesSync({
//   required Isar isar,
//   int? batchID,
// }) {
//   if (batchID != null) {
//     return isar.catalogedBarcodes
//         .filter()
//         .batchIDEqualTo(batchID)
//         .findAllSync();
//   }
//   return isar.catalogedBarcodes.where().findAllSync();
// }

// ///default: Returns null
// ///
// ///id: [CatalogedBarcode] mathcing the ID
// ///
// ///barcodeUID: [CatalogedBarcode] matching the BarcodeUID
// ///
// CatalogedBarcode? getCatalogedBarcodeSync({
//   required Isar isar,
//   int? id,
//   String? barcodeUID,
// }) {
//   if (id != null) {
//     return isar.catalogedBarcodes.filter().idEqualTo(id).findFirstSync();
//   }
//   if (barcodeUID != null) {
//     return isar.catalogedBarcodes
//         .filter()
//         .barcodeUIDEqualTo(barcodeUID)
//         .findFirstSync();
//   }
//   return null;
// }
