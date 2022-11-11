part of tswiri_database;

///default: null.
///
///id: Returns [TagText] matching id.
TagText? getTagTextSync({
  int? id,
  String? text,
}) {
  if (id != null) {
    return _isar!.tagTexts.getSync(id);
  }

  if (text != null) {
    return _isar!.tagTexts
        .filter()
        .textMatches(text.toLowerCase().trim())
        .findFirstSync();
  }

  return null;
}
