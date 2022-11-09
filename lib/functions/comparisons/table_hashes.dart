part of tswiri_database;

int hashBarcodeBatchs() {
  //Table size.
  String byteSize = _isar!.barcodeBatchs.getSizeSync().toString();

  //Table count.
  int count = _isar!.barcodeBatchs.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.barcodeBatchs.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.barcodeBatchs.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.barcodeBatchs.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;
  return stringToHash.hashCode;
}

int hashCatalogedBarcodes() {
  //Table size.
  String byteSize = _isar!.catalogedBarcodes.getSizeSync().toString();

  //Table count.
  int count = _isar!.catalogedBarcodes.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.catalogedBarcodes.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.catalogedBarcodes.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.catalogedBarcodes.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;
  return stringToHash.hashCode;
}

int hashCatalogedContainers() {
  //Table size.
  String byteSize = _isar!.catalogedContainers.getSizeSync().toString();

  //Table count.
  int count = _isar!.catalogedContainers.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.catalogedContainers.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.catalogedContainers.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.catalogedContainers.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashCatalogedCoordinates() {
  //Table size.
  String byteSize = _isar!.catalogedCoordinates.getSizeSync().toString();

  //Table count.
  int count = _isar!.catalogedCoordinates.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.catalogedCoordinates.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.catalogedCoordinates.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.catalogedCoordinates.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashCatalogedGrids() {
  //Table size.
  String byteSize = _isar!.catalogedGrids.getSizeSync().toString();

  //Table count.
  int count = _isar!.catalogedGrids.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.catalogedGrids.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.catalogedGrids.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.catalogedGrids.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashContainerRelationships() {
  //Table size.
  String byteSize = _isar!.containerRelationships.getSizeSync().toString();

  //Table count.
  int count = _isar!.containerRelationships.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.containerRelationships.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.containerRelationships.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.containerRelationships.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashContainerTags() {
  //Table size.
  String byteSize = _isar!.containerTags.getSizeSync().toString();

  //Table count.
  int count = _isar!.containerTags.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.containerTags.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.containerTags.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.containerTags.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashContainerTypes() {
  //Table size.
  String byteSize = _isar!.containerTypes.getSizeSync().toString();

  //Table count.
  int count = _isar!.containerTypes.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.containerTypes.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.containerTypes.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.containerTypes.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashMarkers() {
  //Table size.
  String byteSize = _isar!.markers.getSizeSync().toString();

  //Table count.
  int count = _isar!.markers.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.markers.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.markers.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.markers.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashMLDetectedLabelTexts() {
  //Table size.
  String byteSize = _isar!.mLDetectedLabelTexts.getSizeSync().toString();

  //Table count.
  int count = _isar!.mLDetectedLabelTexts.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.mLDetectedLabelTexts.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.mLDetectedLabelTexts.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.mLDetectedLabelTexts.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashMLPhotoLabel() {
  //Table size.
  String byteSize = _isar!.photoLabels.getSizeSync().toString();

  //Table count.
  int count = _isar!.photoLabels.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.photoLabels.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.photoLabels.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.photoLabels.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashMLObjects() {
  //Table size.
  String byteSize = _isar!.mLObjects.getSizeSync().toString();

  //Table count.
  int count = _isar!.mLObjects.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.mLObjects.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.mLObjects.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.mLObjects.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashMLObjectLabels() {
  //Table size.
  String byteSize = _isar!.mLObjectLabels.getSizeSync().toString();

  //Table count.
  int count = _isar!.mLObjectLabels.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.mLObjectLabels.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.mLObjectLabels.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.mLObjectLabels.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashMLDetectedElementTexts() {
  //Table size.
  String byteSize = _isar!.mLDetectedElementTexts.getSizeSync().toString();

  //Table count.
  int count = _isar!.mLDetectedElementTexts.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.mLDetectedElementTexts.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.mLDetectedElementTexts.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.mLDetectedElementTexts.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashMLTextBlocks() {
  //Table size.
  String byteSize = _isar!.mLTextBlocks.getSizeSync().toString();

  //Table count.
  int count = _isar!.mLTextBlocks.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.mLTextBlocks.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.mLTextBlocks.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.mLTextBlocks.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashMLTextElements() {
  //Table size.
  String byteSize = _isar!.mLTextElements.getSizeSync().toString();

  //Table count.
  int count = _isar!.mLTextElements.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.mLTextElements.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.mLTextElements.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.mLTextElements.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashMLTextLines() {
//Table size.
  String byteSize = _isar!.mLTextLines.getSizeSync().toString();

  //Table count.
  int count = _isar!.mLTextLines.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.mLTextLines.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.mLTextLines.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.mLTextLines.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashObjectLabels() {
  //Table size.
  String byteSize = _isar!.objectLabels.getSizeSync().toString();

  //Table count.
  int count = _isar!.objectLabels.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.objectLabels.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.objectLabels.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.objectLabels.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashPhotos() {
  //Table size.
  String byteSize = _isar!.photos.getSizeSync().toString();

  //Table count.
  int count = _isar!.photos.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.photos.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.photos.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.photos.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashPhotoLabels() {
  //Table size.
  String byteSize = _isar!.photoLabels.getSizeSync().toString();

  //Table count.
  int count = _isar!.photoLabels.countSync();

  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.photoLabels.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.photoLabels.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.photoLabels.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}

int hashTagTexts() {
  //Table size.
  String byteSize = _isar!.tagTexts.getSizeSync().toString();

  //Table count.
  int count = _isar!.tagTexts.countSync();
  String firstJson = '';
  String middleJson = '';
  String lastJson = '';

  if (count < 0) {
    //First value.
    firstJson = jsonEncode(
      _isar!.tagTexts.where().findAllSync().first,
    );

    //Middle value.
    middleJson = jsonEncode(
      (_isar!.tagTexts.where().findAllSync()[count ~/ 2]),
    );

    //Last value.
    lastJson = jsonEncode(
      _isar!.tagTexts.where().findAllSync().last,
    );
  }

  String stringToHash =
      byteSize + count.toString() + firstJson + middleJson + lastJson;

  return stringToHash.hashCode;
}
