part of tswiri_database;

///Deletes a [Photo] and all references.
deletePhoto({
  required Isar isar,
  required Photo photo,
}) {
  _isar!.writeTxnSync(() {
    //1. Delete PhotoLabel (s).
    _isar!.photoLabels.filter().photoUIDEqualTo(photo.uid).deleteAllSync();

    //2. Delete MLPhotoLabel (S).
    _isar!.mLPhotoLabels.filter().photoUIDEqualTo(photo.uid).deleteAllSync();

    List<String> mlObjectUIDs = _isar!.mLObjects
        .filter()
        .photoUIDEqualTo(photo.uid)
        .findAllSync()
        .map((e) => e.uid)
        .toList();

    //3. Delete MLObject(s).
    _isar!.mLObjects.filter().photoUIDEqualTo(photo.uid).deleteAllSync();

    for (var mlObjectID in mlObjectUIDs) {
      //4. Delete MLObjectLabel(s)
      _isar!.mLObjectLabels
          .filter()
          .objectUIDEqualTo(mlObjectID)
          .deleteAllSync();
      //5. Delete ObjectLabel (s).
      _isar!.objectLabels.filter().objectUIDEqualTo(mlObjectID).deleteAllSync();
    }

    List<MLTextElement> mlTextElements =
        _isar!.mLTextElements.filter().photoUIDEqualTo(photo.uid).findAllSync();

    Set<String> lineIDs = {};
    for (MLTextElement mlTextElement in mlTextElements) {
      lineIDs.add(mlTextElement.lineUID);
      //6. Delete MLTextElement (s).
      _isar!.mLTextElements.deleteSync(mlTextElement.id);
    }

    Set<String> blockUIDs = {};
    for (String lineUID in lineIDs) {
      List<MLTextLine> mlTextLines =
          _isar!.mLTextLines.filter().uidEqualTo(lineUID).findAllSync();
      for (MLTextLine element in mlTextLines) {
        blockUIDs.add(element.blockUID);
        //7. Delete MLTextLine (s).
        _isar!.mLTextLines.deleteSync(element.id);
      }
    }

    for (String blockUID in blockUIDs) {
      //8. Delete MLTextBlock (s).
      _isar!.mLTextBlocks.filter().uidEqualTo(blockUID).deleteFirstSync();
    }

    //9. Delete Photo.
    _isar!.photos.deleteSync(photo.id);

    //Delete files.
    File(photo.getPhotoPath()).deleteSync();
    File(photo.getPhotoThumbnailPath()).deleteSync();
  });
}
