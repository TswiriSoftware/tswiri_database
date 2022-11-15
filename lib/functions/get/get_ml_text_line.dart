part of tswiri_database;

///Returns all [MLTextLine] related to the list of mlTextElements.
List<MLTextLine> getRelatedMLTextLines({
  required List<MLTextElement> mlTextElements,
}) {
  return _isar!.mLTextLines
      .filter()
      .anyOf(mlTextElements,
          (q, MLTextElement element) => q.idEqualTo(element.lineID))
      .findAllSync();
}
