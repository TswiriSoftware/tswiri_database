part of tswiri_database;

///Delete's a single container and all references
void deleteContainer(CatalogedContainer catalogedContainer) {
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

    _isar!.markers
        .filter()
        .barcodeUIDMatches(catalogedContainer.barcodeUID!)
        .deleteAllSync();
  });

  //Delete Photos.
  List<Photo> photos = _isar!.photos
      .filter()
      .containerUIDMatches(catalogedContainer.containerUID)
      .findAllSync();

  for (Photo photo in photos) {
    deletePhoto(photo);
  }
}
