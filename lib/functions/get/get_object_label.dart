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

///Returns all [ObjectLabel] related to the list of mlObjects.
List<ObjectLabel> getRelatedObjectLabels({
  required List<MLObject> mlObjects,
}) {
  return _isar!.objectLabels
      .filter()
      .allOf(mlObjects, (q, MLObject element) => q.objectIDEqualTo(element.id))
      .findAllSync();
}
