part of tswiri_database;

int? putMLDetectedElementText(
    {required MLDetectedElementText mlDetectedElementText}) {
  int? tagTextID;
  _isar!.writeTxnSync(() {
    tagTextID = _isar!.mLDetectedElementTexts.putSync(mlDetectedElementText);
  });
  return tagTextID;
}
