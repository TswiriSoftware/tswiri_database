import 'package:tswiri_database/src/collections/export.dart';

///Deletes a container and all its references.
List<Photo> deleteContainer({
  required Isar isar,
  required CatalogedContainer catalogedContainer,
}) {
  List<Photo> photos = isar.photos
      .filter()
      .containerUIDMatches(catalogedContainer.uid)
      .findAllSync();

  isar.writeTxnSync(() {
    //Delete Container.
    isar.catalogedContainers.deleteSync(catalogedContainer.id);
    //Delete ContainerTags
    isar.containerTags
        .filter()
        .containerUIDMatches(catalogedContainer.uid)
        .deleteAllSync();

    //Delete Container Relationships.
    isar.containerRelationships
        .filter()
        .parentUIDMatches(catalogedContainer.uid)
        .deleteAllSync();

    isar.containerRelationships
        .filter()
        .containerUIDMatches(catalogedContainer.uid)
        .deleteAllSync();

    //Delete Marker
    isar.markers
        .filter()
        .barcodeUIDMatches(catalogedContainer.barcodeUID)
        .deleteAllSync();

    //Delete Photos.

    for (Photo photo in photos) {
      //1. Delete PhotoLabel (s).
      isar.photoLabels.filter().photoUIDEqualTo(photo.uid).deleteAllSync();

      //2. Delete MLPhotoLabel (S).
      isar.mLPhotoLabels.filter().photoUIDEqualTo(photo.uid).deleteAllSync();

      List<String> mlObjectUIDs = isar.mLObjects
          .filter()
          .photoUIDEqualTo(photo.uid)
          .findAllSync()
          .map((e) => e.uid)
          .toList();

      //3. Delete MLObject(s).
      isar.mLObjects.filter().photoUIDEqualTo(photo.uid).deleteAllSync();

      for (var mlObjectUID in mlObjectUIDs) {
        //4. Delete MLObjectLabel(s)
        isar.mLObjectLabels
            .filter()
            .objectUIDEqualTo(mlObjectUID)
            .deleteAllSync();
        //5. Delete ObjectLabel (s).
        isar.objectLabels
            .filter()
            .objectUIDEqualTo(mlObjectUID)
            .deleteAllSync();
      }

      List<MLTextElement> mlTextElements =
          isar.mLTextElements.filter().photoUIDEqualTo(photo.uid).findAllSync();

      Set<String> lineUIDs = {};
      for (MLTextElement mlTextElement in mlTextElements) {
        lineUIDs.add(mlTextElement.lineUID);
        //6. Delete MLTextElement (s).
        isar.mLTextElements.deleteSync(mlTextElement.id);
      }

      Set<String> blockUIDs = {};
      for (String lineUID in lineUIDs) {
        List<MLTextLine> mlTextLines =
            isar.mLTextLines.filter().uidEqualTo(lineUID).findAllSync();
        for (MLTextLine element in mlTextLines) {
          blockUIDs.add(element.blockUID);
          //7. Delete MLTextLine (s).
          isar.mLTextLines.deleteSync(element.id);
        }
      }

      for (String blockUID in blockUIDs) {
        //8. Delete MLTextBlock (s).
        isar.mLTextBlocks.filter().uidEqualTo(blockUID).deleteFirstSync();
      }

      //9. Delete Photo.
      isar.photos.deleteSync(photo.id);
    }
  });
  return photos;
}
