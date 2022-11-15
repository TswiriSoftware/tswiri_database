part of tswiri_database;

///Deletes a container and all its references.
List<Photo> deleteContainer({
  required CatalogedContainer catalogedContainer,
}) {
  List<Photo> photos = _isar!.photos
      .filter()
      .containerUIDMatches(catalogedContainer.containerUID)
      .findAllSync();

  _isar!.writeTxnSync(() {
    //Delete Container.
    _isar!.catalogedContainers.deleteSync(catalogedContainer.id);
    //Delete ContainerTags
    _isar!.containerTags
        .filter()
        .containerUIDMatches(catalogedContainer.containerUID)
        .deleteAllSync();

    //Delete Container Relationships.
    _isar!.containerRelationships
        .filter()
        .parentUIDMatches(catalogedContainer.containerUID)
        .deleteAllSync();

    _isar!.containerRelationships
        .filter()
        .containerUIDMatches(catalogedContainer.containerUID)
        .deleteAllSync();

    //Delete Marker
    _isar!.markers
        .filter()
        .barcodeUIDMatches(catalogedContainer.barcodeUID!)
        .deleteAllSync();

    //Delete Photos.

    for (Photo photo in photos) {
      //1. Delete PhotoLabel (s).
      _isar!.photoLabels.filter().photoIDEqualTo(photo.id).deleteAllSync();

      //2. Delete MLPhotoLabel (S).
      _isar!.mLPhotoLabels.filter().photoIDEqualTo(photo.id).deleteAllSync();

      List<int> mlObjectIDs = _isar!.mLObjects
          .filter()
          .photoIDEqualTo(photo.id)
          .findAllSync()
          .map((e) => e.id)
          .toList();

      //3. Delete MLObject(s).
      _isar!.mLObjects.filter().photoIDEqualTo(photo.id).deleteAllSync();

      for (var mlObjectID in mlObjectIDs) {
        //4. Delete MLObjectLabel(s)
        _isar!.mLObjectLabels
            .filter()
            .objectIDEqualTo(mlObjectID)
            .deleteAllSync();
        //5. Delete ObjectLabel (s).
        _isar!.objectLabels
            .filter()
            .objectIDEqualTo(mlObjectID)
            .deleteAllSync();
      }

      List<MLTextElement> mlTextElements =
          _isar!.mLTextElements.filter().photoIDEqualTo(photo.id).findAllSync();

      Set<int> lineIDs = {};
      for (MLTextElement mlTextElement in mlTextElements) {
        lineIDs.add(mlTextElement.lineID);
        //6. Delete MLTextElement (s).
        _isar!.mLTextElements.deleteSync(mlTextElement.id);
      }

      Set<int> blockIDs = {};
      for (int lineID in lineIDs) {
        List<MLTextLine> mlTextLines =
            _isar!.mLTextLines.filter().idEqualTo(lineID).findAllSync();
        for (MLTextLine element in mlTextLines) {
          blockIDs.add(element.blockID);
          //7. Delete MLTextLine (s).
          _isar!.mLTextLines.deleteSync(element.id);
        }
      }

      for (int blockID in blockIDs) {
        //8. Delete MLTextBlock (s).
        _isar!.mLTextBlocks.deleteSync(blockID);
      }

      //9. Delete Photo.
      _isar!.photos.deleteSync(photo.id);
    }
  });
  return photos;
}
