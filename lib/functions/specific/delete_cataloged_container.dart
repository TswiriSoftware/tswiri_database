part of tswiri_database;

///Deletes a container and all its references.
List<Photo> deleteContainer({
  required Isar isar,
  required CatalogedContainer catalogedContainer,
}) {
  List<Photo> photos = _isar!.photos
      .filter()
      .containerUIDMatches(catalogedContainer.uid)
      .findAllSync();

  _isar!.writeTxnSync(() {
    //Delete Container.
    _isar!.catalogedContainers.deleteSync(catalogedContainer.id);
    //Delete ContainerTags
    _isar!.containerTags
        .filter()
        .containerUIDMatches(catalogedContainer.uid)
        .deleteAllSync();

    //Delete Container Relationships.
    _isar!.containerRelationships
        .filter()
        .parentUIDMatches(catalogedContainer.uid)
        .deleteAllSync();

    _isar!.containerRelationships
        .filter()
        .containerUIDMatches(catalogedContainer.uid)
        .deleteAllSync();

    //Delete Marker
    _isar!.markers
        .filter()
        .barcodeUIDMatches(catalogedContainer.barcodeUID)
        .deleteAllSync();

    //Delete Photos.

    for (Photo photo in photos) {
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

      for (var mlObjectUID in mlObjectUIDs) {
        //4. Delete MLObjectLabel(s)
        _isar!.mLObjectLabels
            .filter()
            .objectUIDEqualTo(mlObjectUID)
            .deleteAllSync();
        //5. Delete ObjectLabel (s).
        _isar!.objectLabels
            .filter()
            .objectUIDEqualTo(mlObjectUID)
            .deleteAllSync();
      }

      List<MLTextElement> mlTextElements = _isar!.mLTextElements
          .filter()
          .photoUIDEqualTo(photo.uid)
          .findAllSync();

      Set<String> lineUIDs = {};
      for (MLTextElement mlTextElement in mlTextElements) {
        lineUIDs.add(mlTextElement.lineUID);
        //6. Delete MLTextElement (s).
        _isar!.mLTextElements.deleteSync(mlTextElement.id);
      }

      Set<String> blockUIDs = {};
      for (String lineUID in lineUIDs) {
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
    }
  });
  return photos;
}
