part of tswiri_database;

void createDefaultContainerTypes() {
  if (_isar!.containerTypes.where().findAllSync().isEmpty) {
    _isar!.writeTxnSync(
      () {
        _isar!.containerTypes.putSync(ContainerType()
          ..id = 0
          ..containerTypeName = 'Area'
          ..containerDescription =
              '- An Area is a stationary container with a marker.\n- which can contain all other types of containers.\n- It is part of the childrens grid.'
          ..canContain = [1, 2, 3]
          ..moveable = false
          ..enclosing = false
          ..containerColor = EmbeddedColor(data: '4294924066')
          ..iconData = EmbeddedIconData(data: ['59298', 'MaterialIcons'])
          ..preferredChildContainer = 1);

        _isar!.containerTypes.putSync(
          ContainerType()
            ..id = 1
            ..containerTypeName = 'Shelf'
            ..containerDescription =
                '- A Shelf is a stationary container with a marker.\n- which can contain Boxes and/or Drawers.\n- It is part of the childrens grid.'
            ..canContain = [2, 3]
            ..moveable = false
            ..enclosing = false
            ..containerColor = EmbeddedColor(data: '4283215696')
            ..iconData = EmbeddedIconData(data: ['59815', 'MaterialIcons'])
            ..preferredChildContainer = 3,
        );

        _isar!.containerTypes.putSync(
          ContainerType()
            ..id = 2
            ..containerTypeName = 'Drawer'
            ..containerDescription =
                '- A Drawer is a stationary container.\n- which can contain boxes.\n- It does not form part of the childrens grid.'
            ..canContain = [1]
            ..moveable = false
            ..enclosing = true
            ..containerColor = EmbeddedColor(data: '4280391411')
            ..iconData = EmbeddedIconData(data: ['60844', 'MaterialIcons'])
            ..preferredChildContainer = 3,
        );

        _isar!.containerTypes.putSync(
          ContainerType()
            ..id = 3
            ..containerTypeName = 'Box'
            ..containerDescription = '- A Box is a moveable container...'
            ..canContain = [1]
            ..moveable = true
            ..enclosing = true
            ..containerColor = EmbeddedColor(data: '4294543462')
            ..iconData = EmbeddedIconData(data: ['61748', 'MaterialIcons'])
            ..preferredChildContainer = 3,
        );
      },
    );
  }
}
