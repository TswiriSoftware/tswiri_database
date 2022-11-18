// import 'package:tswiri_database/src/collections/export.dart';

// ///default: Returns a list of all [Photo].
// ///
// ///containerUID: Returns a list of [Photo] matching containerUID.
// List<Photo> getPhotosSync({
//   String? containerUID,
// }) {
//   if (containerUID != null) {
//     return _isar!.photos
//         .filter()
//         .containerUIDMatches(containerUID)
//         .findAllSync();
//   }

//   return _isar!.photos.where().findAllSync();
// }

// ///Returns a [Photo] matching on ID.
// Photo? getPhotoSync({
//   int? id,
// }) {
//   if (id != null) {
//     return _isar!.photos.getSync(id);
//   }
//   return null;
// }
