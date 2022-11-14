part of tswiri_database;

///Returns a list of [MLObjectLabel].
List<MLObjectLabel> getMLObjectLabels({
  int? detectedLabelTextID,
}) {
  if (detectedLabelTextID != null) {
    return _isar!.mLObjectLabels
        .filter()
        .detectedLabelTextIDEqualTo(detectedLabelTextID)
        .findAllSync();
  }

  return _isar!.mLObjectLabels.where().findAllSync();
}
