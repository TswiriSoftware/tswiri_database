part of tswiri_database;

///default: null.
///
///id: Returns [TagText] matching id.
TagText? getTagTextSync({
  int? id,
}) {
  if (id != null) {
    return _isar!.tagTexts.getSync(id);
  }

  return null;
}
