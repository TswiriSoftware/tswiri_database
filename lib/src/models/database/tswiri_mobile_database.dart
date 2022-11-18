import 'dart:io';

import 'package:tswiri_database/src/collections/export.dart';
import 'package:tswiri_database/src/initializers/mobile_database.dart';
import 'package:tswiri_database/src/models/database/tswiri_database_object.dart';
import 'package:tswiri_database/src/models/info/photo_info.dart';

import '../../functions/get/_get_export.dart' as g;
import '../../functions/specific/_export_specific.dart' as s;
import '../info/cataloged_container_info.dart';

class TswiriMobileDatabase extends TswiriDatabaseObject {
  TswiriMobileDatabase({
    required super.directory,
  }) {
    init();
  }

  ///The Database.
  late Isar _isar;

  ///The databaseID.
  late int databaseID;

  ///Initiate the database.
  @override
  init() {
    //Initialize Isar.
    _isar = initialiseMobileDatabase(directory: directory);

    //Check if the db has info stored.
    if (_isar.databaseInfos.countSync() == 0) {
      databaseID = s.createDatabaseInfo(isar: _isar);
    } else {
      databaseID = _isar.databaseInfos.getSync(0)!.databaseID;
    }

    //Create default container types.
    if (_isar.containerTypes.countSync() == 0) {
      s.createDefaultContainerTypes(isar: _isar);
    }
  }

  ///Once called object should be disposed of.
  @override
  Future close() async {
    _isar.close();
  }

  ///Creates [BarcodeBatch] and Creates list of linked [CatalogedBarcode]s.
  List<CatalogedBarcode> createBarcodeBatch({
    required BarcodeBatch batch,
    required List<CatalogedBarcode> catalogedBarcodes,
  }) {
    return s.createBarcodeBatch(
      isar: _isar,
      batch: batch,
      catalogedBarcodes: catalogedBarcodes,
    );
  }

  ///Creates a new [CatalogedContainer].
  CatalogedContainer createCatalogedContainer({
    required CatalogedContainer catalogedContainer,
    required ContainerRelationship? containerRelationship,
    required Marker? marker,
  }) {
    return s.createCatalogedContainer(
      isar: _isar,
      catalogedContainer: catalogedContainer,
      containerRelationship: containerRelationship,
      marker: marker,
      databaseID: databaseID,
    );
  }

  ///Creates the default [ContainerType]s.
  createDefaultContainerTypes() {
    return s.createDefaultContainerTypes(
      isar: _isar,
    );
  }

  ///Creates a [CatalogedGrid] with [CatalogedCoordinate]s.
  createNewGrid({
    required CatalogedGrid catalogedGrid,
    required CatalogedCoordinate catalogedCoordinate,
  }) {
    return s.createNewGrid(
      isar: _isar,
      catalogedGrid: catalogedGrid,
      catalogedCoordinate: catalogedCoordinate,
    );
  }

  /// Creates a new [Photo].
  createPhoto({
    required Photo photo,
    required List<MLPhotoLabel> mlPhotoLabels,
    required List<PhotoLabel> photoLabels,
    required List<MLObject> mlObjects,
    required List<MLObjectLabel> mlObjectLabels,
    required List<ObjectLabel> objectLabels,
    required List<MLTextBlock> mlTextBlocks,
    required List<MLTextLine> mlTextLines,
    required List<MLTextElement> mlTextElements,
  }) {
    return s.createPhoto(
      isar: _isar,
      photo: photo,
      mlPhotoLabels: mlPhotoLabels,
      photoLabels: photoLabels,
      mlObjects: mlObjects,
      mlObjectLabels: mlObjectLabels,
      objectLabels: objectLabels,
      mlTextBlocks: mlTextBlocks,
      mlTextLines: mlTextLines,
      mlTextElements: mlTextElements,
    );
  }

  deleteBarcodeBatch({
    required String uid,
  }) {
    return s.deleteBarcodeBatch(
      isar: _isar,
      uid: uid,
    );
  }

  deleteContainer({
    required CatalogedContainer catalogedContainer,
  }) {
    return s.deleteContainer(
      isar: _isar,
      catalogedContainer: catalogedContainer,
      photoDirectory: photoDirectory,
      thumbnailDirectory: thumbnailDirectory,
    );
  }

  deleteGrid({
    required CatalogedGrid catalogedGrid,
  }) {
    return s.deleteGrid(
      isar: _isar,
      catalogedGrid: catalogedGrid,
    );
  }

  deletePhoto({
    required Photo photo,
  }) {
    return s.deletePhoto(
      isar: _isar,
      photo: photo,
    );
  }

  updateBarcodeBatch({
    required BarcodeBatch barcodeBatch,
    required List<CatalogedBarcode> barcodes,
  }) {
    return s.updateBarcodeBatch(
      isar: _isar,
      barcodeBatch: barcodeBatch,
      barcodes: barcodes,
    );
  }

  updateCoordinates({
    required String gridUID,
    required List<CatalogedCoordinate> coordinates,
  }) {
    return s.updateCoordinates(
      isar: _isar,
      gridUID: gridUID,
      coordinates: coordinates,
    );
  }

  CatalogedContainerInfo getCatalogedContainerInfo({
    required CatalogedContainer catalogedContainer,
  }) {
    return g.getCatalogedContainerInfo(
      isar: _isar,
      catalogedContainer: catalogedContainer,
    );
  }

  PhotoInfo getPhotoInfo({
    required Photo photo,
  }) {
    return g.getPhotoInfo(
      isar: _isar,
      photo: photo,
      photoDirectory: photoDirectory,
    );
  }

  CatalogedContainer? getCatalogedContainer({
    String? uid,
    String? barcodeUID,
    String? containerUID,
    String? containerTypeUID,
  }) {
    return g.getCatalogedContainerSync(
      isar: _isar,
      uid: uid,
      barcodeUID: barcodeUID,
      containerUID: containerUID,
      containerTypeUID: containerTypeUID,
    );
  }

  List<CatalogedContainer> getCatalogedContainers({
    String? containerTypeUID,
  }) {
    return g.getCatalogedContainersSync(
      isar: _isar,
      containerTypeUID: containerTypeUID,
    );
  }

  CatalogedBarcode? getCatalogedBarcode({
    String? uid,
    String? barcodeUID,
  }) {
    return g.getCatalogedBarcodeSync(
      isar: _isar,
      uid: uid,
      barcodeUID: barcodeUID,
    );
  }

  List<CatalogedBarcode> getCatalogedBarcodes({
    required String? batchUID,
  }) {
    return g.getCatalogedBarcodesSync(isar: _isar, batchUID: batchUID);
  }

  List<ContainerType> get containerTypes => g.getContainerTypes(isar: _isar);

  ///The photos Directory
  @override
  Directory get photoDirectory {
    return Directory('${directory.path}/photos');
  }

  Directory get thumbnailDirectory {
    return Directory('${directory.path}/thumbnails');
  }

  @override
  Directory get isarDirectory {
    return Directory('${directory.path}/isar');
  }
}
