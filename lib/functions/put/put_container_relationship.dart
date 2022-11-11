part of tswiri_database;

putContainerRelationship(
    {required ContainerRelationship containerRelationship}) {
  _isar!.writeTxnSync(
    () => _isar!.containerRelationships.putSync(containerRelationship),
  );
}
