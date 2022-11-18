import '../../collections/export.dart';

List<ContainerType> getContainerTypes({
  required Isar isar,
}) {
  return isar.containerTypes.where().findAllSync();
}
