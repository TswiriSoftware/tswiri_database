import 'dart:io';

import 'package:tswiri_database/src/collections/export.dart';

///Deletes a [Photo] and all references.
deletePhoto({
  required Isar isar,
  required Photo photo,
}) {
  isar.writeTxnSync(() {
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

    for (var mlObjectID in mlObjectUIDs) {
      //4. Delete MLObjectLabel(s)
      isar.mLObjectLabels.filter().objectUIDEqualTo(mlObjectID).deleteAllSync();
      //5. Delete ObjectLabel (s).
      isar.objectLabels.filter().objectUIDEqualTo(mlObjectID).deleteAllSync();
    }

    List<MLTextElement> mlTextElements =
        isar.mLTextElements.filter().photoUIDEqualTo(photo.uid).findAllSync();

    Set<String> lineIDs = {};
    for (MLTextElement mlTextElement in mlTextElements) {
      lineIDs.add(mlTextElement.lineUID);
      //6. Delete MLTextElement (s).
      isar.mLTextElements.deleteSync(mlTextElement.id);
    }

    Set<String> blockUIDs = {};
    for (String lineUID in lineIDs) {
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

    // //Delete files.
    // File(photo.getPhotoPath()).deleteSync();
    // File(photo.getPhotoThumbnailPath()).deleteSync();
  });
}
