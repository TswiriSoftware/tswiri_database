part of tswiri_database;

///default: Returns a list of all [Photo].
///
///containerUID: Returns a list of [Photo] matching containerUID.
List<Photo> getPhotosSync({
  String? containerUID,
}) {
  if (containerUID != null) {
    return _isar!.photos
        .filter()
        .containerUIDMatches(containerUID)
        .findAllSync();
  }

  return _isar!.photos.where().findAllSync();
}
