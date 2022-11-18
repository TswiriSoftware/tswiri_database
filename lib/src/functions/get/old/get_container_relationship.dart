import 'package:tswiri_database/src/collections/export.dart';

///default: Returns a list of all [CatalogedGrid].
///
///parentUID: Returns a list of [CatalogedGrid] matching parentUID.
///
///containerUID: Returns a list of [CatalogedGrid] matching containerUID.
List<ContainerRelationship> getContainerRelationshipsSync({
  required Isar isar,
  String? parentUID,
  String? containerUID,
}) {
  if (parentUID != null) {
    return isar.containerRelationships
        .filter()
        .parentUIDMatches(parentUID)
        .findAllSync();
  }
  if (containerUID != null) {
    return isar.containerRelationships
        .filter()
        .containerUIDMatches(containerUID)
        .findAllSync();
  }
  return isar.containerRelationships.where().findAllSync();
}

///default: Returns null.
///
///parentUID: Returns a [ContainerRelationship] matching parentUID.
///
///containerUID: Returns a [ContainerRelationship] matching containerUID.
ContainerRelationship? getContainerRelationshipSync({
  required Isar isar,
  String? parentUID,
  String? containerUID,
}) {
  if (parentUID != null) {
    return isar.containerRelationships
        .filter()
        .parentUIDMatches(parentUID)
        .findFirstSync();
  }
  if (containerUID != null) {
    return isar.containerRelationships
        .filter()
        .containerUIDMatches(containerUID)
        .findFirstSync();
  }
  return null;
}
