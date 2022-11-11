part of tswiri_database;

deleteContainerRelationship({required int id}) {
  _isar!.writeTxnSync(
    () => _isar!.containerRelationships.deleteSync(id),
  );
}
