part of tswiri_database;

putContainerTag({required ContainerTag containerTag}) {
  _isar!.writeTxnSync(() => _isar!.containerTags.putSync(containerTag));
}
