part of tswiri_database;

///default: Returns a list of all [ContainerTag].
List<ContainerTag> getContainerTagsSync({
  String? containerUID,
}) {
  if (containerUID != null) {
    return _isar!.containerTags
        .filter()
        .containerUIDMatches(containerUID)
        .findAllSync();
  }
  return _isar!.containerTags.where().findAllSync();
}

///Returns a list of [ContainerTag] where tagTextID.
List<ContainerTag> getContainerTagsOnTagTextID({
  required int tagTextID,
}) {
  return _isar!.containerTags
      .filter()
      .tagTextIDEqualTo(tagTextID)
      .findAllSync();
}
