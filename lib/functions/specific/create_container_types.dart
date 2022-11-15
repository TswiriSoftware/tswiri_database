part of tswiri_database;

///Creates the default [ContainerType]s.
createDefaultContainerTypes() {
  if (_isar!.containerTypes.where().findAllSync().isEmpty) {
    _isar!.writeTxnSync(
      () {
        _isar!.containerTypes.putSync(ContainerType()
          ..id = 0
          ..name = 'Area'
          ..description =
              '- An Area is a stationary container with a marker.\n- which can contain all other types of containers.\n- It is part of the childrens grid.'
          ..canContain = [1, 2, 3]
          ..moveable = false
          ..enclosing = false
          ..color = '4294924066'
          ..iconData = ['59298', 'MaterialIcons']
          ..preferredChildContainer = 1);

        _isar!.containerTypes.putSync(
          ContainerType()
            ..id = 1
            ..name = 'Shelf'
            ..description =
                '- A Shelf is a stationary container with a marker.\n- which can contain Boxes and/or Drawers.\n- It is part of the childrens grid.'
            ..canContain = [2, 3]
            ..moveable = false
            ..enclosing = false
            ..color = '4283215696'
            ..iconData = ['59815', 'MaterialIcons']
            ..preferredChildContainer = 3,
        );

        _isar!.containerTypes.putSync(
          ContainerType()
            ..id = 2
            ..name = 'Drawer'
            ..description =
                '- A Drawer is a stationary container.\n- which can contain boxes.\n- It does not form part of the childrens grid.'
            ..canContain = [1]
            ..moveable = false
            ..enclosing = true
            ..color = '4280391411'
            ..iconData = ['60844', 'MaterialIcons']
            ..preferredChildContainer = 3,
        );

        _isar!.containerTypes.putSync(
          ContainerType()
            ..id = 3
            ..name = 'Box'
            ..description = '- A Box is a moveable container...'
            ..canContain = [1]
            ..moveable = true
            ..enclosing = true
            ..color = '4294543462'
            ..iconData = ['61748', 'MaterialIcons']
            ..preferredChildContainer = 3,
        );
      },
    );
  }
}
