import 'package:tswiri_database/src/models/info/cataloged_container_info.dart';

import '../../collections/export.dart';

///Get [CatalogedContainerInfo] of this [CatalogedContainer].
CatalogedContainerInfo getCatalogedContainerInfo({
  required Isar isar,
  required CatalogedContainer catalogedContainer,
}) {
  return CatalogedContainerInfo(
    isar: isar,
    catalogedContainer: catalogedContainer,
  );
}
