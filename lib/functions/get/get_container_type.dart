part of tswiri_database;

///default: Returns a list of all [ContainerType].
List<ContainerType> getContainerTypesSync() {
  return _isar!.containerTypes.where().findAllSync();
}