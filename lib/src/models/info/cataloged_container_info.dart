import 'package:tswiri_database/src/collections/export.dart';

class CatalogedContainerInfo {
  CatalogedContainerInfo({
    required Isar isar,
    required this.catalogedContainer,
  }) {
    _isar = isar;
  }

  //Isar.
  late Isar _isar;

  ///The Cataloged Container.
  CatalogedContainer catalogedContainer;

  ///The Container Relationship.
  late ContainerRelationship? containerRelationship = _isar
      .containerRelationships
      .filter()
      .containerUIDMatches(catalogedContainer.uid)
      .findFirstSync();

  ///Barocde linked to this [CatalogedContainer].
  late CatalogedBarcode catalogedBarcode = _isar.catalogedBarcodes
      .filter()
      .barcodeUIDMatches(catalogedContainer.barcodeUID)
      .findFirstSync()!;

  ///Cataloged Coordinate linked to this [CatalogedBarcode].
  late CatalogedCoordinate? catalogedCoordinate = _isar.catalogedCoordinates
      .filter()
      .barcodeUIDMatches(catalogedBarcode.barcodeUID)
      .findFirstSync();

  ///The cataloged grid this [CatalogedCoordinate] is linked to.
  late CatalogedGrid? catalogedGrid = catalogedCoordinate != null
      ? _isar.catalogedGrids
          .filter()
          .uidMatches(catalogedCoordinate!.gridUID)
          .findFirstSync()
      : null;

  ///Tags linked to this [CatalogedContainer].
  late List<ContainerTag> containerTags = _isar.containerTags
      .filter()
      .containerUIDMatches(catalogedContainer.uid)
      .findAllSync();

  ///Photos linked to this [CatalogedContainer].
  late List<Photo> photos = _isar.photos
      .filter()
      .containerUIDMatches(catalogedContainer.uid)
      .findAllSync();
}
