part of tswiri_database;

///Returns [ObjectLabel] where tagTextID matches.
List<ObjectLabel> getObjectLabels({
  int? tagTextID,
}) {
  if (tagTextID != null) {
    return _isar!.objectLabels
        .filter()
        .tagTextIDEqualTo(tagTextID)
        .findAllSync();
  }

  return _isar!.objectLabels.where().findAllSync();
}
