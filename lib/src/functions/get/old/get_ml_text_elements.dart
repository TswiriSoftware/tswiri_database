// import 'package:tswiri_database/src/collections/export.dart';

// ///default: Returns a list of all [MLTextElement].
// ///
// ///photoID: Returns a list of [MLTextElement] matching photoID.
// ///
// List<MLTextElement> getMLTextElements({
//   int? photoID,
//   int? mlDetectedElementTextID,
// }) {
//   if (photoID != null) {
//     return _isar!.mLTextElements.filter().photoIDEqualTo(photoID).findAllSync();
//   }
//   if (mlDetectedElementTextID != null) {
//     return _isar!.mLTextElements
//         .filter()
//         .detectedElementTextIDEqualTo(mlDetectedElementTextID)
//         .findAllSync();
//   }

//   return _isar!.mLTextElements.where().findAllSync();
// }
