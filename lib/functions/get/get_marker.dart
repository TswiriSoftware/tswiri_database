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

///Returns all [Marker] in the list of [CatalogedCoordinate].
List<Marker> getMarkersInCatalogedCoordinates({
  required List<CatalogedCoordinate> catalogedCoordinates,
}) {
  return _isar!.markers
      .filter()
      .anyOf(catalogedCoordinates,
          (q, CatalogedCoordinate e) => q.barcodeUIDMatches(e.barcodeUID))
      .findAllSync();
}

///default: Returns all [Marker].
List<Marker> getMarkers() {
  return _isar!.markers.where().findAllSync();
}

///default: Returns null
///
///id: [Marker] mathcing the ID.
///
///barcodeUID: [Marker] matching the BarcodeUID.
///
Marker? getMarker({
  int? id,
  String? barcodeUID,
}) {
  if (id != null) {
    return _isar!.markers.getSync(id);
  }

  if (barcodeUID != null) {
    return _isar!.markers
        .filter()
        .barcodeUIDMatches(barcodeUID)
        .findFirstSync()!;
  }

  return null;
}
