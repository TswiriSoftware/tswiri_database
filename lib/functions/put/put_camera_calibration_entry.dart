part of tswiri_database;

///Put a list of [CameraCalibrationEntry]
void putCameraCalibrationEntries({
  required List<CameraCalibrationEntry> entries,
}) {
  _isar!.writeTxnSync(
    () => _isar!.cameraCalibrationEntrys.putAllSync(entries),
  );
}
