// import 'package:tswiri_database/src/collections/export.dart';

// ///default: Returns a list of all [MLPhotoLabel].
// ///
// ///photoID: Returns a list of [MLPhotoLabel] matching photoID.
// ///
// List<MLPhotoLabel> getMLPhotoLabels({
//   int? photoID,
//   int? mlDetectedLabelID,
// }) {
//   if (photoID != null) {
//     return _isar!.mLPhotoLabels.filter().photoIDEqualTo(photoID).findAllSync();
//   }
//   if (mlDetectedLabelID != null) {
//     return _isar!.mLPhotoLabels
//         .filter()
//         .detectedLabelTextIDEqualTo(mlDetectedLabelID)
//         .findAllSync();
//   }
//   return _isar!.mLPhotoLabels.where().findAllSync();
// }
