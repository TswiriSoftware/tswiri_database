part of tswiri_database;

int? putMlDetectedLabelText(
    {required MLDetectedLabelText mlDetectedLabelText}) {
  int? tagTextID;
  _isar!.writeTxnSync(() {
    tagTextID = _isar!.mLDetectedLabelTexts.putSync(mlDetectedLabelText);
  });
  return tagTextID;
}
