import 'package:tswiri_database/src/collections/export.dart';

///Creates a new [Photo].
createPhoto({
  required Isar isar,
  required Photo photo,
  required List<MLPhotoLabel> mlPhotoLabels,
  required List<PhotoLabel> photoLabels,
  required List<MLObject> mlObjects,
  required List<MLObjectLabel> mlObjectLabels,
  required List<ObjectLabel> objectLabels,
  required List<MLTextBlock> mlTextBlocks,
  required List<MLTextLine> mlTextLines,
  required List<MLTextElement> mlTextElements,
}) {
  isar.writeTxnSync(() {
    int photoID = isar.photos.putSync(photo);
    String photoUID = isar.photos.getSync(photoID)!.uid;

    ///Write Photo Labels to Isar.
    for (MLPhotoLabel mlPhotoLabel in mlPhotoLabels) {
      isar.mLPhotoLabels.putSync(
        MLPhotoLabel()
          ..confidence = mlPhotoLabel.confidence
          ..detectedLabelTextUID = mlPhotoLabel.detectedLabelTextUID
          ..photoUID = photoUID
          ..userFeedback = mlPhotoLabel.userFeedback,
      );
    }

    for (PhotoLabel photoLabel in photoLabels) {
      isar.photoLabels.putSync(PhotoLabel()
        ..photoUID = photoUID
        ..tagTextUID = photoLabel.tagTextUID);
    }

    ///Write Objects to Isar.
    for (MLObject mlObject in mlObjects) {
      int objectID = isar.mLObjects.putSync(
        MLObject()
          ..boundingBox = mlObject.boundingBox
          ..photoUID = photoUID,
      );

      String objectUID = isar.mLObjects.getSync(objectID)!.uid;

      ///Write Object Labels to Isar.
      for (MLObjectLabel mlObjectLabel in mlObjectLabels
          .where((element) => element.objectUID == mlObject.id)) {
        isar.mLObjectLabels.putSync(
          MLObjectLabel()
            ..confidence = mlObjectLabel.confidence
            ..detectedLabelTextUID = mlObjectLabel.detectedLabelTextUID
            ..objectUID = objectUID
            ..userFeedback = mlObjectLabel.userFeedback,
        );
      }

      for (ObjectLabel objectLabel in objectLabels
          .where((element) => element.objectUID == mlObject.id)) {
        isar.objectLabels.putSync(ObjectLabel()
          ..objectUID = objectUID
          ..tagTextUID = objectLabel.tagTextUID);
      }
    }

    ///Write Text Blocks to isar.
    for (MLTextBlock mlTextBlock in mlTextBlocks) {
      int textBlockID = isar.mLTextBlocks.putSync(
        MLTextBlock()
          ..cornerPoints = mlTextBlock.cornerPoints
          ..recognizedLanguages = mlTextBlock.recognizedLanguages,
      );

      String textBlockUID = isar.mLTextBlocks.getSync(textBlockID)!.uid;

      ///Write Text Lines to isar.
      for (MLTextLine mlTextLine in mlTextLines
          .where((element) => element.blockUID == mlTextBlock.id)) {
        int lineID = isar.mLTextLines.putSync(
          MLTextLine()
            ..blockUID = textBlockUID
            ..blockIndex = mlTextLine.blockIndex
            ..cornerPoints = mlTextLine.cornerPoints
            ..recognizedLanguages = mlTextLine.recognizedLanguages,
        );

        String lineUID = isar.mLTextLines.getSync(lineID)!.uid;

        ///Write Text Elements to isar.
        for (MLTextElement e in mlTextElements
            .where((element) => element.lineUID == mlTextLine.id)) {
          isar.mLTextElements.putSync(
            MLTextElement()
              ..cornerPoints = e.cornerPoints
              ..mlDetectedElementTextUID = e.mlDetectedElementTextUID
              ..lineUID = lineUID
              ..lineIndex = e.lineIndex
              ..photoUID = photoUID
              ..userFeedback = e.userFeedback,
          );
        }
      }
    }
  });
}
