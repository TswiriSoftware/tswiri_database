import 'package:tswiri_database/src/collections/export.dart';

///Creates a new [CatalogedContainer].
CatalogedContainer createCatalogedContainer({
  required Isar isar,
  required CatalogedContainer catalogedContainer,
  required ContainerRelationship? containerRelationship,
  required Marker? marker,
}) {
  int? id;
  isar.writeTxnSync(() {
    id = isar.catalogedContainers.putSync(catalogedContainer);

    if (containerRelationship != null) {
      isar.containerRelationships.putSync(containerRelationship);
    }

    if (marker != null) {
      isar.markers.putSync(marker);
    }
  });

  return isar.catalogedContainers.getSync(id!)!;
}
