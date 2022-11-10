part of tswiri_database;

///Deletes a containerTag identified by ID.
deleteContainerTag({
  required int id,
}) {
  _isar!.writeTxnSync(() => _isar!.containerTags.deleteSync(id));
}
