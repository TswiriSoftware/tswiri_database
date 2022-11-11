part of tswiri_database;

int? putTagText({required TagText tagText}) {
  int? tagTextID;
  _isar!.writeTxnSync(() {
    tagTextID = _isar!.tagTexts.putSync(tagText);
  });
  return tagTextID;
}
