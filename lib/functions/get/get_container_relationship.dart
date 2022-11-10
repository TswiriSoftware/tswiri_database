part of tswiri_database;

///default: Returns a list of all [CatalogedGrid].
///
///parentUID: Returns a list of [CatalogedGrid] matching parentUID.
///
///containerUID: Returns a list of [CatalogedGrid] matching containerUID.
List<ContainerRelationship> getContainerRelationshipsSync({
  String? parentUID,
  String? containerUID,
}) {
  if (parentUID != null) {
    return _isar!.containerRelationships
        .filter()
        .parentUIDMatches(parentUID)
        .findAllSync();
  }
  if (containerUID != null) {
    return _isar!.containerRelationships
        .filter()
        .containerUIDMatches(containerUID)
        .findAllSync();
  }
  return _isar!.containerRelationships.where().findAllSync();
}

///default: Returns null.
///
///parentUID: Returns a [ContainerRelationship] matching parentUID.
///
///containerUID: Returns a [ContainerRelationship] matching containerUID.
ContainerRelationship? getContainerRelationshipSync({
  String? parentUID,
  String? containerUID,
}) {
  if (parentUID != null) {
    return _isar!.containerRelationships
        .filter()
        .parentUIDMatches(parentUID)
        .findFirstSync();
  }
  if (containerUID != null) {
    return _isar!.containerRelationships
        .filter()
        .containerUIDMatches(containerUID)
        .findFirstSync();
  }
  return null;
}
