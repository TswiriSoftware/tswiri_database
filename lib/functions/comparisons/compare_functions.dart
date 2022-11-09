// ///This compares the 2 databases.
// Map<String, bool> compareDatabaseHashes({
//   required Map<String, int> thisDatabase,
//   required Map<String, int> otherDatabase,
// }) {
//   return {
//     'barcodeBatchs': compareBarcodeBatchs(thisDatabase['barcodeBatchs']!, otherDatabase['barcodeBatchs']!),
//     'catalogedBarcodes': compareCatalogedBarcodes(thisDatabase['catalogedBarcodes']!, otherDatabase['catalogedBarcodes']!),
//     'catalogedContainers': ,
//     'catalogedCoordinates': ,
//     'catalogedGrids': ,
//     'containerRelationships': ,
//     'containerTags': ,
//     'containerTypes': ,
//     'markers': ,
//     'mLDetectedLabelTexts': ,
//     'mLPhotoLabels': ,
//     'mLObjects': ,
//     'mLObjectLabels': ,
//     'mLDetectedElementTexts': ,
//     'mLTextBlocks': ,
//     'mLTextElements': ,
//     'mLTextLines': ,
//     'objectLabels': ,
//     'photos': ,
//     'photoLabels': ,
//     'tagTexts': ,
//   };
// }

///This compares the source table to the other table.
/// Match = true
/// Not Mathcing = false
bool compareBarcodeBatchs(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

bool compareCatalogedBarcodes(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

bool compareCatalogedContainers(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

bool compareCatalogedCoordinates(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

bool compareCatalogedGrids(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

//   'containerRelationships': json['containerRelationships'] as int,
bool compareContainerRelationships(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

//   'containerTags': json['containerTags'] as int,
bool compareContainerTags(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

//   'containerTypes': json['containerTypes'] as int,
bool compareContainerTypes(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

//   'markers': json['markers'] as int,
bool compareMarkers(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

//   'mLDetectedLabelTexts': json['mLDetectedLabelTexts'] as int,
bool compareMLDetectedLabelTexts(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

//   'mLPhotoLabels': json['mLPhotoLabels'] as int,
bool compareMLPhotoLabels(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

//   'mLObjects': json['mLObjects'] as int,
bool compareMLObjects(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

//   'mLObjectLabels': json['mLObjectLabels'] as int,
bool compareMLObjectLabels(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

//   'mLDetectedElementTexts': json['mLDetectedElementTexts'] as int,
bool compareMLDetectedElementTexts(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

//   'mLTextBlocks': json['mLTextBlocks'] as int,
bool compareMLTextBlocks(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

//   'mLTextElements': json['mLTextElements'] as int,
bool compareMLTextElements(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

//   'mLTextLines': json['mLTextLines'] as int,
bool compareMLTextLines(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

//   'objectLabels': json['objectLabels'] as int,
bool compareObjectLabels(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

//   'photos': json['photos'] as int,
bool comparePhotos(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

//   'photoLabels': json['photoLabels'] as int,
bool comparePhotoLabels(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}

//   'tagTexts': json['tagTexts'] as int,
bool compareTagTexts(int source, int other) {
  if (source == other) {
    return true;
  } else {
    return false;
  }
}
