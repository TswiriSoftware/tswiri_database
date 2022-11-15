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

///Returns a list of [TagText] where the text contains the enteredKeyword
List<TagText> getTagTextsThatContain({
  required String enteredKeyword,
}) {
  return _isar!.tagTexts
      .filter()
      .textContains(enteredKeyword, caseSensitive: false)
      .findAllSync();
}

///Returns all [TagText] matching on the list of TagTextIDs
List<TagText> getAllTagTexts({
  required Set<int> tagTextIDs,
}) {
  return _isar!.tagTexts
      .filter()
      .allOf(tagTextIDs, (q, int element) => q.idEqualTo(element))
      .findAllSync();
}
