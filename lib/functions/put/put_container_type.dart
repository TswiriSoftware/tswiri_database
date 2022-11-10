part of tswiri_database;

putContainerType({
  required ContainerType containerType,
}) {
  _isar!.writeTxnSync(() {
    _isar!.containerTypes.putSync(
      containerType,
    );
  });
}
