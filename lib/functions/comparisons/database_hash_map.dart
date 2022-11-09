part of tswiri_database;

Map<String, int> decodeJsonDatabase(String data) {
  Map<String, dynamic>? json = jsonDecode(data) as Map<String, dynamic>;
  return {
    'barcodeBatchs': json['barcodeBatchs'] as int,
    'catalogedBarcodes': json['catalogedBarcodes'] as int,
    'catalogedContainers': json['catalogedContainers'] as int,
    'catalogedCoordinates': json['catalogedCoordinates'] as int,
    'catalogedGrids': json['catalogedGrids'] as int,
    'containerRelationships': json['containerRelationships'] as int,
    'containerTags': json['containerTags'] as int,
    'containerTypes': json['containerTypes'] as int,
    'markers': json['markers'] as int,
    'mLDetectedLabelTexts': json['mLDetectedLabelTexts'] as int,
    'mLPhotoLabels': json['mLPhotoLabels'] as int,
    'mLObjects': json['mLObjects'] as int,
    'mLObjectLabels': json['mLObjectLabels'] as int,
    'mLDetectedElementTexts': json['mLDetectedElementTexts'] as int,
    'mLTextBlocks': json['mLTextBlocks'] as int,
    'mLTextElements': json['mLTextElements'] as int,
    'mLTextLines': json['mLTextLines'] as int,
    'objectLabels': json['objectLabels'] as int,
    'photos': json['photos'] as int,
    'photoLabels': json['photoLabels'] as int,
    'tagTexts': json['tagTexts'] as int,
  };
}

String get databaseHashesJson {
  return jsonEncode(databaseHashes);
}

Map<String, int> get databaseHashes {
  return {
    'barcodeBatchs': hashBarcodeBatchs(),
    'catalogedBarcodes': hashCatalogedBarcodes(),
    'catalogedContainers': hashCatalogedContainers(),
    'catalogedCoordinates': hashCatalogedCoordinates(),
    'catalogedGrids': hashCatalogedGrids(),
    'containerRelationships': hashContainerRelationships(),
    'containerTags': hashContainerTags(),
    'containerTypes': hashContainerTypes(),
    'markers': hashMarkers(),
    'mLDetectedLabelTexts': hashMLDetectedLabelTexts(),
    'mLPhotoLabels': hashMLPhotoLabel(),
    'mLObjects': hashMLObjects(),
    'mLObjectLabels': hashMLObjectLabels(),
    'mLDetectedElementTexts': hashMLDetectedElementTexts(),
    'mLTextBlocks': hashMLTextBlocks(),
    'mLTextElements': hashMLTextElements(),
    'mLTextLines': hashMLTextLines(),
    'objectLabels': hashObjectLabels(),
    'photos': hashPhotos(),
    'photoLabels': hashPhotoLabels(),
    'tagTexts': hashTagTexts(),
  };
}
