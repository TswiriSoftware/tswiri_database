part of tswiri_database;

///Returns a list of all [Marker] that are contained in the list of gridBarcodes.
List<Marker> getMarkersFromGridBarcodeUIDsSync({
  required List<String> gridBarcodeUIDs,
}) {
  return _isar!.markers
      .filter()
      .anyOf(
          gridBarcodeUIDs, (q, String element) => q.barcodeUIDMatches(element))
      .findAllSync();
}
