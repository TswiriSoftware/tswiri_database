part of tswiri_database;

///used to create a new [Photo].
createPhoto({
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
  _isar!.writeTxnSync(() {
    int photoID = _isar!.photos.putSync(photo);

    ///Write Photo Labels to Isar.
    for (MLPhotoLabel mlPhotoLabel in mlPhotoLabels) {
      _isar!.mLPhotoLabels.putSync(
        MLPhotoLabel()
          ..confidence = mlPhotoLabel.confidence
          ..detectedLabelTextID = mlPhotoLabel.detectedLabelTextID
          ..photoID = photoID
          ..userFeedback = mlPhotoLabel.userFeedback,
      );
    }

    for (PhotoLabel photoLabel in photoLabels) {
      _isar!.photoLabels.putSync(PhotoLabel()
        ..photoID = photoID
        ..tagTextID = photoLabel.tagTextID);
    }

    ///Write Objects to Isar.
    for (MLObject mlObject in mlObjects) {
      int objectID = _isar!.mLObjects.putSync(
        MLObject()
          ..boundingBox = mlObject.boundingBox
          ..photoID = photoID,
      );

      ///Write Object Labels to Isar.
      for (MLObjectLabel mlObjectLabel in mlObjectLabels
          .where((element) => element.objectID == mlObject.id)) {
        _isar!.mLObjectLabels.putSync(
          MLObjectLabel()
            ..confidence = mlObjectLabel.confidence
            ..detectedLabelTextID = mlObjectLabel.detectedLabelTextID
            ..objectID = objectID
            ..userFeedback = mlObjectLabel.userFeedback,
        );
      }

      for (ObjectLabel objectLabel
          in objectLabels.where((element) => element.objectID == mlObject.id)) {
        _isar!.objectLabels.putSync(ObjectLabel()
          ..objectID = objectID
          ..tagTextID = objectLabel.tagTextID);
      }
    }

    ///Write Text Blocks to isar.
    for (MLTextBlock mlTextBlock in mlTextBlocks) {
      int textBlockID = _isar!.mLTextBlocks.putSync(
        MLTextBlock()
          ..cornerPoints = mlTextBlock.cornerPoints
          ..recognizedLanguages = mlTextBlock.recognizedLanguages,
      );

      ///Write Text Lines to isar.
      for (MLTextLine mlTextLine in mlTextLines
          .where((element) => element.blockID == mlTextBlock.id)) {
        int lineID = _isar!.mLTextLines.putSync(
          MLTextLine()
            ..blockID = textBlockID
            ..blockIndex = mlTextLine.blockIndex
            ..cornerPoints = mlTextLine.cornerPoints
            ..recognizedLanguages = mlTextLine.recognizedLanguages,
        );

        ///Write Text Elements to isar.
        for (MLTextElement e in mlTextElements
            .where((element) => element.lineID == mlTextLine.id)) {
          _isar!.mLTextElements.putSync(
            MLTextElement()
              ..cornerPoints = e.cornerPoints
              ..detectedElementTextID = e.detectedElementTextID
              ..lineID = lineID
              ..lineIndex = e.lineIndex
              ..photoID = photoID
              ..userFeedback = e.userFeedback,
          );
        }
      }
    }
  });
}
