import 'package:tswiri_database/src/collections/export.dart';

///default: Returns a list of all [CameraCalibrationEntry].
///
List<CameraCalibrationEntry> getCameraCalibrationEntries({
  required Isar isar,
}) {
  return isar.cameraCalibrationEntrys.where().findAllSync();
}
