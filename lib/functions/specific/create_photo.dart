part of tswiri_database;

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
  _isar!.writeTxnSync(() {
    int photoID = _isar!.photos.putSync(photo);
    Photo p = _isar!.photos.getSync(photoID)!;

    ///Write Photo Labels to Isar.
    for (MLPhotoLabel mlPhotoLabel in mlPhotoLabels) {
      _isar!.mLPhotoLabels.putSync(
        MLPhotoLabel()
          ..confidence = mlPhotoLabel.confidence
          ..detectedLabelTextUID = mlPhotoLabel.detectedLabelTextUID
          ..photoUID = p.uid
          ..userFeedback = mlPhotoLabel.userFeedback,
      );
    }

    for (PhotoLabel photoLabel in photoLabels) {
      _isar!.photoLabels.putSync(PhotoLabel()
        ..photoUID = p.uid
        ..tagTextUID = photoLabel.tagTextUID);
    }

    ///Write Objects to Isar.
    for (MLObject mlObject in mlObjects) {
      int objectID = _isar!.mLObjects.putSync(
        MLObject()
          ..boundingBox = mlObject.boundingBox
          ..photoUID = p.uid,
      );

      ///Write Object Labels to Isar.
      for (MLObjectLabel mlObjectLabel in mlObjectLabels
          .where((element) => element.objectUID == mlObject.id)) {
        _isar!.mLObjectLabels.putSync(
          MLObjectLabel()
            ..confidence = mlObjectLabel.confidence
            ..detectedLabelTextUID = mlObjectLabel.detectedLabelTextUID
            ..objectUID = objectID
            ..userFeedback = mlObjectLabel.userFeedback,
        );
      }

      for (ObjectLabel objectLabel in objectLabels
          .where((element) => element.objectUID == mlObject.id)) {
        _isar!.objectLabels.putSync(ObjectLabel()
          ..objectUID = objectID
          ..tagTextUID = objectLabel.tagTextUID);
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
          .where((element) => element.blockUID == mlTextBlock.id)) {
        int lineID = _isar!.mLTextLines.putSync(
          MLTextLine()
            ..blockUID = textBlockID
            ..blockIndex = mlTextLine.blockIndex
            ..cornerPoints = mlTextLine.cornerPoints
            ..recognizedLanguages = mlTextLine.recognizedLanguages,
        );

        ///Write Text Elements to isar.
        for (MLTextElement e in mlTextElements
            .where((element) => element.lineUID == mlTextLine.id)) {
          _isar!.mLTextElements.putSync(
            MLTextElement()
              ..cornerPoints = e.cornerPoints
              ..mlDetectedElementTextUID = e.mlDetectedElementTextUID
              ..lineUID = lineID
              ..lineIndex = e.lineIndex
              ..photoUID = photoID
              ..userFeedback = e.userFeedback,
          );
        }
      }
    }
  });
}
