// ignore_for_file: constant_identifier_names

part of tswiri_database;

enum Collections {
  BarcodeBatch,
  CatalogedBarcode,
  CatalogedContainer,
  CatalogedCoordinate,
  CatalogedGrid,
  ContainerRelationship,
  ContainerTag,
  ContainerType,
  Marker,
  MLDetectedLabelText,
  MLPhotoLabel,
  MLObject,
  MLObjectLabel,
  MLDetectedElementText,
  MLTextBlock,
  MLTextElement,
  MLTextLine,
  ObjectLabel,
  PhotoLabel,
  Photo,
  TagText,

  //Mobile only.
  CameraCalibrationEntry,
}