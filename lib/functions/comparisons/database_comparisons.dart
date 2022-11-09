import 'compare_functions.dart';

///Used to compare 2 databases.
class DatabaseCompare {
  DatabaseCompare({
    required this.thisDatabase,
    required this.otherDatabase,
  }) {
    _compare();
  }

  ///The source.
  Map<String, int> thisDatabase;

  ///The database being compared to the source
  Map<String, int> otherDatabase;

  _compare() {
    barcodeBatchs = compareBarcodeBatchs(
      thisDatabase['barcodeBatchs']!,
      otherDatabase['barcodeBatchs']!,
    );
    catalogedBarcodes = compareCatalogedBarcodes(
      thisDatabase['catalogedBarcodes']!,
      otherDatabase['catalogedBarcodes']!,
    );
    catalogedContainers = compareCatalogedContainers(
      thisDatabase['catalogedContainers']!,
      otherDatabase['catalogedContainers']!,
    );
    catalogedCoordinates = compareCatalogedCoordinates(
      thisDatabase['catalogedCoordinates']!,
      otherDatabase['catalogedCoordinates']!,
    );
    catalogedGrids = compareCatalogedGrids(
      thisDatabase['catalogedGrids']!,
      otherDatabase['catalogedGrids']!,
    );
    containerRelationships = compareContainerRelationships(
      thisDatabase['containerRelationships']!,
      otherDatabase['containerRelationships']!,
    );
    containerTags = compareContainerTags(
      thisDatabase['containerTags']!,
      otherDatabase['containerTags']!,
    );
    containerTypes = compareContainerTypes(
      thisDatabase['containerTypes']!,
      otherDatabase['containerTypes']!,
    );
    markers = compareMarkers(
      thisDatabase['markers']!,
      otherDatabase['markers']!,
    );
    mLDetectedLabelTexts = compareMLDetectedLabelTexts(
      thisDatabase['mLDetectedLabelTexts']!,
      otherDatabase['mLDetectedLabelTexts']!,
    );
    mLPhotoLabels = compareMLPhotoLabels(
      thisDatabase['mLPhotoLabels']!,
      otherDatabase['mLPhotoLabels']!,
    );
    mLObjects = compareMLObjects(
      thisDatabase['mLObjects']!,
      otherDatabase['mLObjects']!,
    );
    mLObjectLabels = compareMLObjectLabels(
      thisDatabase['mLObjectLabels']!,
      otherDatabase['mLObjectLabels']!,
    );
    mLDetectedElementTexts = compareMLDetectedElementTexts(
      thisDatabase['mLDetectedElementTexts']!,
      otherDatabase['mLDetectedElementTexts']!,
    );
    mLTextBlocks = compareMLTextBlocks(
      thisDatabase['mLTextBlocks']!,
      otherDatabase['mLTextBlocks']!,
    );
    mLTextElements = compareMLTextElements(
      thisDatabase['mLTextElements']!,
      otherDatabase['mLTextElements']!,
    );
    mLTextLines = compareMLTextLines(
      thisDatabase['mLTextLines']!,
      otherDatabase['mLTextLines']!,
    );
    objectLabels = compareObjectLabels(
      thisDatabase['objectLabels']!,
      otherDatabase['objectLabels']!,
    );
    photos = comparePhotos(
      thisDatabase['photos']!,
      otherDatabase['photos']!,
    );
    photoLabels = comparePhotoLabels(
      thisDatabase['photoLabels']!,
      otherDatabase['photoLabels']!,
    );
    tagTexts = compareTagTexts(
      thisDatabase['tagTexts']!,
      otherDatabase['tagTexts']!,
    );
  }

  late bool barcodeBatchs;
  late bool catalogedBarcodes;
  late bool catalogedContainers;
  late bool catalogedCoordinates;
  late bool catalogedGrids;
  late bool containerRelationships;
  late bool containerTags;
  late bool containerTypes;
  late bool markers;
  late bool mLDetectedLabelTexts;
  late bool mLPhotoLabels;
  late bool mLObjects;
  late bool mLObjectLabels;
  late bool mLDetectedElementTexts;
  late bool mLTextBlocks;
  late bool mLTextElements;
  late bool mLTextLines;
  late bool objectLabels;
  late bool photos;
  late bool photoLabels;
  late bool tagTexts;

  void printResults() {
    print(
        'barcodeBatchs:           $barcodeBatchs, S: ${thisDatabase['barcodeBatchs']}, O: ${otherDatabase['barcodeBatchs']}');
    print(
        'catalogedBarcodes:       $catalogedBarcodes, S: ${thisDatabase['catalogedBarcodes']}, O: ${otherDatabase['catalogedBarcodes']}');
    print(
        'catalogedContainers:     $catalogedContainers, S: ${thisDatabase['catalogedContainers']}, O: ${otherDatabase['catalogedContainers']}');
    print(
        'catalogedCoordinates:    $catalogedCoordinates, S: ${thisDatabase['catalogedCoordinates']}, O: ${otherDatabase['catalogedCoordinates']}');
    print(
        'catalogedGrids:          $catalogedGrids, S: ${thisDatabase['catalogedGrids']}, O: ${otherDatabase['catalogedGrids']}');
    print(
        'containerRelationships:  $containerRelationships, S: ${thisDatabase['containerRelationships']}, O: ${otherDatabase['containerRelationships']}');
    print(
        'containerTypes:          $containerTypes, S: ${thisDatabase['containerTypes']}, O: ${otherDatabase['containerTypes']}');
    print(
        'markers:                 $markers, S: ${thisDatabase['markers']}, O: ${otherDatabase['markers']}');
    print(
        'mLDetectedLabelTexts:    $mLDetectedLabelTexts, S: ${thisDatabase['mLDetectedLabelTexts']}, O: ${otherDatabase['mLDetectedLabelTexts']}');
    print(
        'mLPhotoLabels:           $mLPhotoLabels, S: ${thisDatabase['mLPhotoLabels']}, O: ${otherDatabase['mLPhotoLabels']}');
    print(
        'mLObjects:               $mLObjects, S: ${thisDatabase['mLObjects']}, O: ${otherDatabase['mLObjects']}');
    print(
        'mLObjectLabels:          $mLObjectLabels, S: ${thisDatabase['mLObjectLabels']}, O: ${otherDatabase['mLObjectLabels']}');
    print(
        'mLDetectedElementTexts:  $mLDetectedElementTexts, S: ${thisDatabase['mLDetectedElementTexts']}, O: ${otherDatabase['mLDetectedElementTexts']}');
    print(
        'mLTextBlocks:            $mLTextBlocks, S: ${thisDatabase['mLTextBlocks']}, O: ${otherDatabase['mLTextBlocks']}');
    print(
        'mLTextElements:          $mLTextElements, S: ${thisDatabase['mLTextElements']}, O: ${otherDatabase['mLTextElements']}');
    print(
        'mLTextLines:             $mLTextLines, S: ${thisDatabase['mLTextLines']}, O: ${otherDatabase['mLTextLines']}');
    print(
        'objectLabels:            $objectLabels, S: ${thisDatabase['objectLabels']}, O: ${otherDatabase['objectLabels']}');
    print(
        'photos:                  $photos, S: ${thisDatabase['photos']}, O: ${otherDatabase['photos']}');
    print(
        'photoLabels:             $photoLabels, S: ${thisDatabase['photoLabels']}, O: ${otherDatabase['photoLabels']}');
    print(
        'tagTexts:                $tagTexts, S: ${thisDatabase['tagTexts']}, O: ${otherDatabase['tagTexts']}');
  }
}
