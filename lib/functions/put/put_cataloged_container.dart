part of tswiri_database;

int putCatalogedContainer({required CatalogedContainer container}) {
  int id = 0;
  _isar!.writeTxnSync(() {
    id = _isar!.catalogedContainers.putSync(
      container,
    );
  });
  return id;
}
