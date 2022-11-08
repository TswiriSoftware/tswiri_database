import 'dart:convert';
import 'package:tswiri_database/export.dart';

///Generate a hash of the BarcodeBatch Collection.
int hashBarcodeBatchs(Isar isar) {
  return jsonEncode(isar.barcodeBatchs.where().findAllSync()).hashCode;
}

///Generate a hash of the hCameraCalibrationEntry Collection.
int hashCameraCalibrationEntrys(Isar isar) {
  return jsonEncode(isar.cameraCalibrationEntrys.where().findAllSync())
      .hashCode;
}

///Generate a hash of the CatalogedBarcode Collection.
int hashCatalogedBarcodes(Isar isar) {
  return jsonEncode(isar.catalogedBarcodes.where().findAllSync()).hashCode;
}

///Generate a hash of the CatalogedContainer Collection.
int hashCatalogedContainers(Isar isar) {
  return jsonEncode(isar.catalogedContainers.where().findAllSync()).hashCode;
}

///Generate a hash of the CatalogedCoordinate Collection.
int hashCatalogedCoordinates(Isar isar) {
  return jsonEncode(isar.catalogedCoordinates.where().findAllSync()).hashCode;
}

///Generate a hash of the CatalogedGrid Collection.
int hashCatalogedGrids(Isar isar) {
  return jsonEncode(isar.catalogedGrids.where().findAllSync()).hashCode;
}

///Generate a hash of the ContainerRelationship Collection.
int hashContainerRelationships(Isar isar) {
  return jsonEncode(isar.containerRelationships.where().findAllSync()).hashCode;
}

///Generate a hash of the ContainerTag Collection.
int hashContainerTags(Isar isar) {
  return jsonEncode(isar.containerTags.where().findAllSync()).hashCode;
}

///Generate a hash of the ContainerType Collection.
int hashContainerTypes(Isar isar) {
  return jsonEncode(isar.containerTypes.where().findAllSync()).hashCode;
}

///Generate a hash of the Marker Collection.
int hashMarkers(Isar isar) {
  return jsonEncode(isar.markers.where().findAllSync()).hashCode;
}

///Generate a hash of the MLDetectedLabelText Collection.
int hashMLDetectedLabelTexts(Isar isar) {
  return jsonEncode(isar.mLDetectedLabelTexts.where().findAllSync()).hashCode;
}

///Generate a hash of the MLPhotoLabel Collection.
int hashMLPhotoLabel(Isar isar) {
  return jsonEncode(isar.mLPhotoLabels.where().findAllSync()).hashCode;
}

///Generate a hash of the MLObject Collection.
int hashMLObjects(Isar isar) {
  return jsonEncode(isar.mLObjects.where().findAllSync()).hashCode;
}

///Generate a hash of the MLObjectLabel Collection.
int hashMLObjectLabels(Isar isar) {
  return jsonEncode(isar.mLObjectLabels.where().findAllSync()).hashCode;
}

///Generate a hash of the MLDetectedElementText Collection.
int hashMLDetectedElementTexts(Isar isar) {
  return jsonEncode(isar.mLDetectedElementTexts.where().findAllSync()).hashCode;
}

///Generate a hash of the MLTextBlock Collection.
int hashMLTextBlocks(Isar isar) {
  return jsonEncode(isar.mLTextBlocks.where().findAllSync()).hashCode;
}

///Generate a hash of the MLTextElement Collection.
int hashMLTextElements(Isar isar) {
  return jsonEncode(isar.mLTextElements.where().findAllSync()).hashCode;
}

///Generate a hash of the MLTextLine Collection.
int hashMLTextLines(Isar isar) {
  return jsonEncode(isar.mLTextLines.where().findAllSync()).hashCode;
}

///Generate a hash of the ObjectLabel Collection.
int hashObjectLabels(Isar isar) {
  return jsonEncode(isar.objectLabels.where().findAllSync()).hashCode;
}

///Generate a hash of the Photo Collection.
int hashPhotos(Isar isar) {
  return jsonEncode(isar.photos.where().findAllSync()).hashCode;
}

///Generate a hash of the PhotoLabel Collection.
int hashPhotoLabels(Isar isar) {
  return jsonEncode(isar.photoLabels.where().findAllSync()).hashCode;
}

///Generate a hash of the TagText Collection.
int hashTagTexts(Isar isar) {
  return jsonEncode(isar.tagTexts.where().findAllSync()).hashCode;
}
