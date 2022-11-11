part of tswiri_database;

///default: Returns a list of all [CameraCalibrationEntry].
///
List<CameraCalibrationEntry> getCameraCalibrationEntries() {
  return _isar!.cameraCalibrationEntrys.where().findAllSync();
}
