import 'package:tswiri_database/export.dart';

///Find all decendants of this cataloged container.
List<CatalogedContainer> findCatalogedContainerDecendants(
    CatalogedContainer catalogedContainer) {
  //1. Find all direct decendants of this container.
  Set<ContainerRelationship> decendants =
      findDecendants(catalogedContainer.containerUID).toSet();

  if (decendants.isNotEmpty) {
    int x = 0;
    int previousDecendantLength = 0;

    while (x < 1000 && previousDecendantLength != decendants.length) {
      for (var decendant in decendants) {
        decendants.addAll(findDecendants(decendant.containerUID));
      }
      x++;
      previousDecendantLength = decendants.length;
    }

    List<CatalogedContainer> catalogedContainers = [];
    for (var decendant in decendants) {
      catalogedContainers.add(isar!.catalogedContainers
          .filter()
          .containerUIDMatches(decendant.containerUID)
          .findFirstSync()!);
    }

    return catalogedContainers;
  } else {
    ///No decendants found.
    return [];
  }
}

///Find container relationships with this containerUID as parentUID.
List<ContainerRelationship> findDecendants(String containerUID) {
  return isar!.containerRelationships
      .filter()
      .parentUIDMatches(containerUID)
      .findAllSync();
}
