part of tswiri_database;

///Writes a [Marker] to database.
putMarker(Marker marker) {
  _isar!.writeTxnSync(() {
    _isar!.markers.putSync(marker);
  });
}
