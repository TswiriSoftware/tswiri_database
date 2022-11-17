part of tswiri_database;

///Returns all [MLTextBlock] related to the list of mlTextLines.
List<MLTextBlock> getRelatedTextBlocks({
  required List<MLTextLine> mlTextLines,
}) {
  return _isar!.mLTextBlocks
      .filter()
      .anyOf(
          mlTextLines, (q, MLTextLine element) => q.idEqualTo(element.blockUID))
      .findAllSync();
}
