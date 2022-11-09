part of tswiri_database;

List<ContainerType> getContainerTypesSync() {
  return _isar!.containerTypes.where().findAllSync();
}
