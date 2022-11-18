// import 'package:tswiri_database/src/collections/export.dart';

// ///Returns a list of [MLObjectLabel].
// List<MLObjectLabel> getMLObjectLabels({
//   int? detectedLabelTextID,
// }) {
//   if (detectedLabelTextID != null) {
//     return _isar!.mLObjectLabels
//         .filter()
//         .detectedLabelTextIDEqualTo(detectedLabelTextID)
//         .findAllSync();
//   }

//   return _isar!.mLObjectLabels.where().findAllSync();
// }

// ///Returns all [MLObjectLabel] related to the list of mlObjects.
// List<MLObjectLabel> getRelatedMLObjectLabels({
//   required List<MLObject> mlObjects,
// }) {
//   return _isar!.mLObjectLabels
//       .filter()
//       .allOf(mlObjects, (q, MLObject element) => q.objectIDEqualTo(element.id))
//       .findAllSync();
// }
