part of tswiri_database;

///Creates a new [CatalogedContainer].
CatalogedContainer createCatalogedContainer({
  required CatalogedContainer catalogedContainer,
  required ContainerRelationship? containerRelationship,
  required Marker? marker,
}) {
  int? id;
  _isar!.writeTxnSync(() {
    id = _isar!.catalogedContainers.putSync(catalogedContainer);

    if (containerRelationship != null) {
      _isar!.containerRelationships.putSync(containerRelationship);
    }

    if (marker != null) {
      _isar!.markers.putSync(marker);
    }
  });

  return _isar!.catalogedContainers.getSync(id!)!;
}
