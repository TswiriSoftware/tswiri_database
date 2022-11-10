part of tswiri_database;

///default: Returns a list of all [ContainerTag].
List<ContainerTag> getContainerTagsSync({
  String? containerUID,
}) {
  return _isar!.containerTags.where().findAllSync();
}
