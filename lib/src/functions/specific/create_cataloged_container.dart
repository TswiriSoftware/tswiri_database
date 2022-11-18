import 'package:tswiri_database/src/collections/export.dart';

///Creates a new [CatalogedContainer].
CatalogedContainer createCatalogedContainer({
  required Isar isar,
  required CatalogedContainer catalogedContainer,
  required ContainerRelationship? containerRelationship,
  required Marker? marker,
  required int databaseID,
}) {
  CatalogedContainer? container;

  isar.writeTxnSync(() {
    int id = isar.catalogedContainers.putSync(catalogedContainer);
    container = isar.catalogedContainers.getSync(id)!;

    if (containerRelationship != null) {
      isar.containerRelationships.putSync(
        containerRelationship..containerUID = container!.uid,
      );
    }

    if (marker != null) {
      isar.markers.putSync(
        marker..containerUID = container!.uid,
      );
    }
  });

  return container!;
}
