// import 'package:tswiri_database/src/collections/export.dart';

// ///default: Returns a list of all [CatalogedContainer].
// ///
// ///containerTypeID: Returns a list of [CatalogedContainer] matching the containerTypeID.
// List<CatalogedContainer> getCatalogedContainersSync({
//   required Isar isar,
//   int? containerTypeID,
// }) {
//   if (containerTypeID != null) {
//     return isar.catalogedContainers
//         .filter()
//         .containerTypeIDEqualTo(containerTypeID)
//         .findAllSync();
//   }

//   return isar.catalogedContainers.where().findAllSync();
// }

// ///default: Returns null
// ///
// ///id: [CatalogedContainer] mathcing the ID.
// ///
// ///barcodeUID: [CatalogedContainer] matching the BarcodeUID.
// ///
// ///containerUID: [CatalogedContainer] matching the containerUID.
// ///
// ///containerTypeID: [CatalogedContainer] matching the containerTypeID.
// CatalogedContainer? getCatalogedContainerSync({
//   required Isar isar,
//   int? id,
//   String? barcodeUID,
//   String? containerUID,
//   int? containerTypeID,
// }) {
//   if (id != null) {
//     return isar.catalogedContainers.getSync(id);
//   }

//   if (barcodeUID != null) {
//     return isar.catalogedContainers
//         .filter()
//         .barcodeUIDMatches(barcodeUID)
//         .findFirstSync();
//   }

//   if (containerUID != null) {
//     return isar.catalogedContainers
//         .filter()
//         .containerUIDMatches(containerUID)
//         .findFirstSync();
//   }

//   if (containerTypeID != null) {
//     return isar.catalogedContainers
//         .filter()
//         .containerTypeIDEqualTo(containerTypeID)
//         .findFirstSync();
//   }

//   return null;
// }

// List<CatalogedContainer> getCatalogedContainersNameContains({
//   required Isar isar,
//   required String enteredKeyword,
// }) {
//   return isar.catalogedContainers
//       .filter()
//       .nameContains(enteredKeyword, caseSensitive: false)
//       .findAllSync();
// }

// List<CatalogedContainer> getCatalogedContainersDescriptionContains({
//   required String enteredKeyword,
// }) {
//   return isar.catalogedContainers
//       .filter()
//       .descriptionContains(enteredKeyword, caseSensitive: false)
//       .findAllSync();
// }
