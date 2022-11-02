import 'dart:convert';
import 'dart:math' as m;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tswiri_database/embedded/corner_points/corner_points.dart';
import 'package:tswiri_database/embedded/embedded_color/embedded_color.dart';
import 'package:tswiri_database/embedded/embedded_icon_data/embedded_icon_data.dart';
import 'package:tswiri_database/embedded/embedded_size/embedded_size.dart';
import 'package:tswiri_database/embedded/embedded_vector_3/embedded_vector_3.dart';
import 'package:tswiri_database/export.dart';
import 'package:vector_math/vector_math_64.dart' as vm;

void main() {
  group('Json: ', () {
    test('BarcodeBatch', () async {
      BarcodeBatch barcodeBatch = BarcodeBatch()
        ..id = 1
        ..height = 20
        ..width = 20
        ..imported = false
        ..timestamp = 9999;

      String json = jsonEncode(barcodeBatch);
      BarcodeBatch barcodeBatchConverted =
          barcodeBatch.fromJson(jsonDecode(json));

      expect(
        barcodeBatchConverted.toJson().toString(),
        barcodeBatch.toJson().toString(),
      );

      List<BarcodeBatch> barcodeBatches = [
        barcodeBatch,
        barcodeBatch,
        barcodeBatch
      ];

      String jsonList = jsonEncode(barcodeBatches);

      List<BarcodeBatch> decodedList = (jsonDecode(jsonList) as List)
          .map((e) => BarcodeBatch().fromJson(e))
          .toList();

      expect(
        jsonEncode(decodedList),
        jsonEncode(barcodeBatches),
      );
    });

    test('CameraCalibrationEntry', () async {
      CameraCalibrationEntry cameraCalibrationEntry = CameraCalibrationEntry()
        ..id = 1
        ..diagonalSize = 20
        ..distanceFromCamera = 20;

      String json = jsonEncode(cameraCalibrationEntry);

      CameraCalibrationEntry cameraCalibrationEntrydecoded =
          CameraCalibrationEntry().fromJson(jsonDecode(json));

      expect(
        cameraCalibrationEntrydecoded.toJson().toString(),
        cameraCalibrationEntry.toJson().toString(),
      );

      List<CameraCalibrationEntry> cameraCalibrationEntries = [
        cameraCalibrationEntry,
        cameraCalibrationEntry,
        cameraCalibrationEntry
      ];

      String jsonList = jsonEncode(cameraCalibrationEntries);
      List<CameraCalibrationEntry> decodedList = (jsonDecode(jsonList) as List)
          .map((e) => CameraCalibrationEntry().fromJson(e))
          .toList();

      expect(
        jsonEncode(decodedList),
        jsonEncode(cameraCalibrationEntries),
      );
    });

    test('CatalogedBarcode', () async {
      CatalogedBarcode catalogedBarcode = CatalogedBarcode()
        ..id = 1
        ..barcodeUID = 'barcodeUID'
        ..batchID = 1
        ..height = 20
        ..width = 20;

      String json = jsonEncode(catalogedBarcode.toJson());

      CatalogedBarcode catalogedBarcodeDecoded =
          CatalogedBarcode().fromJson(jsonDecode(json));

      expect(
        catalogedBarcodeDecoded.toJson().toString(),
        catalogedBarcode.toJson().toString(),
      );
    });

    test('CatalogedContainer', () async {
      CatalogedContainer catalogedContainer = CatalogedContainer()
        ..id = 1
        ..barcodeUID = 'barcodeUID'
        ..containerUID = 'containerUID'
        ..description = 'description'
        ..name = 'name'
        ..containerTypeID = 1;

      String json = jsonEncode(catalogedContainer.toJson());
      CatalogedContainer decodedCatalogedContainer =
          CatalogedContainer().fromJson(jsonDecode(json));
      expect(
        catalogedContainer.toJson().toString(),
        decodedCatalogedContainer.toJson().toString(),
      );
    });

    test('CatalogedCoordinate', () async {
      CatalogedCoordinate catalogedCoordinate = CatalogedCoordinate()
        ..id = 1
        ..barcodeUID = 'barcodeUID'
        ..coordinate = EmbeddedVector3.fromVector(vm.Vector3(0, 0, 0))
        ..gridUID = 1
        ..rotation = EmbeddedVector3.fromVector(vm.Vector3(0, 0, 0))
        ..timestamp = 9999;

      String json = jsonEncode(catalogedCoordinate.toJson());

      CatalogedCoordinate decodedcatalogedCoordinate =
          CatalogedCoordinate().fromJson(jsonDecode(json));

      expect(
        decodedcatalogedCoordinate.toJson().toString(),
        catalogedCoordinate.toJson().toString(),
      );
    });

    test('CatalogedGrid', () async {
      CatalogedGrid catalogedGrid = CatalogedGrid()
        ..id = 1
        ..barcodeUID = 'barcodeUID'
        ..parentBarcodeUID = 'parentBarcodeUID';

      String json = jsonEncode(catalogedGrid.toJson());

      CatalogedGrid dcatalogedGrid = CatalogedGrid().fromJson(jsonDecode(json));

      expect(
        dcatalogedGrid.toJson().toString(),
        catalogedGrid.toJson().toString(),
      );
    });

    test('ContainerRelationship', () async {
      ContainerRelationship containerRelationship = ContainerRelationship()
        ..id = 1
        ..containerUID = 'containerUID'
        ..parentUID = 'parentUID';

      String json = jsonEncode(containerRelationship.toJson());

      ContainerRelationship dcontainerRelationship =
          ContainerRelationship().fromJson(jsonDecode(json));

      expect(
        containerRelationship.toJson().toString(),
        dcontainerRelationship.toJson().toString(),
      );
    });

    test('ContainerTag', () async {
      ContainerTag containerTag = ContainerTag()
        ..id = 1
        ..containerUID = 'containerUID'
        ..tagTextID = 1;
      String json = jsonEncode(containerTag.toJson());

      ContainerTag dcontainerTag = ContainerTag().fromJson(jsonDecode(json));
      expect(
        containerTag.toJson().toString(),
        dcontainerTag.toJson().toString(),
      );
    });

    test('ContainerType', () async {
      ContainerType containerType = ContainerType()
        ..id = 1
        ..canContain = [1, 2]
        ..containerColor =
            EmbeddedColor.fromColor(const Color.fromARGB(255, 190, 37, 26))
        ..containerDescription = ''
        ..containerTypeName = ''
        ..enclosing = false
        ..iconData = EmbeddedIconData.fromIconData(Icons.dangerous)
        ..moveable = false
        ..preferredChildContainer = 1;
      String json = jsonEncode(containerType.toJson());

      ContainerType dcontainerType = ContainerType().fromJson(jsonDecode(json));
      expect(
        containerType.toJson().toString(),
        dcontainerType.toJson().toString(),
      );
    });

    test('Marker', () async {
      Marker marker = Marker()
        ..id = 1
        ..barcodeUID = 'barcodeUID'
        ..containerUID = 'containerUID';
      String json = jsonEncode(marker);

      Marker dmarker = Marker().fromJson(jsonDecode(json));

      expect(
        dmarker.toJson().toString(),
        marker.toJson().toString(),
      );
    });

    test('MLDetectedLabelText', () async {
      MLDetectedLabelText mlDetectedLabelText = MLDetectedLabelText()
        ..id = 1
        ..detectedLabelText = 'detectedLabelText'
        ..hidden = false;
      String json = jsonEncode(mlDetectedLabelText);

      MLDetectedLabelText dmlDetectedLabelText =
          MLDetectedLabelText().fromJson(jsonDecode(json));
      expect(
        dmlDetectedLabelText.toJson().toString(),
        mlDetectedLabelText.toJson().toString(),
      );
    });

    test('MLPhotoLabel', () async {
      MLPhotoLabel mlPhotoLabel = MLPhotoLabel()
        ..id = 1
        ..confidence = 0.5
        ..detectedLabelTextID = 1
        ..photoID = 1
        ..userFeedback = true;
      String json = jsonEncode(mlPhotoLabel);

      MLPhotoLabel dmlPhotoLabel = MLPhotoLabel().fromJson(jsonDecode(json));
      expect(
        mlPhotoLabel.toJson().toString(),
        dmlPhotoLabel.toJson().toString(),
      );
    });

    test('MLObject', () async {
      MLObject mlObject = MLObject()
        ..id = 1
        ..boundingBox = [0, 10, 10, 10]
        ..photoID = 1;
      String json = jsonEncode(mlObject.toJson());

      MLObject dmlObject = MLObject().fromJson(jsonDecode(json));
      expect(
        mlObject.toJson().toString(),
        dmlObject.toJson().toString(),
      );
    });

    test('MLObjectLabel', () async {
      MLObjectLabel mlObjectLabel = MLObjectLabel()
        ..id = 1
        ..confidence = 0.5
        ..detectedLabelTextID = 1
        ..objectID = 1
        ..userFeedback = true;
      String json = jsonEncode(mlObjectLabel);

      MLObjectLabel dmlObjectLabel = MLObjectLabel().fromJson(jsonDecode(json));
      expect(
        mlObjectLabel.toJson().toString(),
        dmlObjectLabel.toJson().toString(),
      );
    });

    test('MLDetectedElementText', () async {
      MLDetectedElementText mlDetectedElementText = MLDetectedElementText()
        ..id = 1
        ..detectedText = 'detectedText'
        ..tagTextID = 1;
      String json = jsonEncode(mlDetectedElementText);
      MLDetectedElementText dmlDetectedElementText =
          MLDetectedElementText().fromJson(jsonDecode(json));
      expect(
        mlDetectedElementText.toJson().toString(),
        dmlDetectedElementText.toJson().toString(),
      );
    });

    test('MLTextBlock', () async {
      MLTextBlock mlTextBlock = MLTextBlock()
        ..id = 1
        ..cornerPoints = CornerPoints.fromCornerPoints([
          const m.Point(1, 2),
          const m.Point(2, 1),
          const m.Point(1, 5),
          const m.Point(6, 2),
        ])
        ..recognizedLanguages = ['aa', 'za'];
      String json = jsonEncode(mlTextBlock);

      MLTextBlock dmlTextBlock = MLTextBlock().fromJson(jsonDecode(json));

      expect(
        mlTextBlock.toJson().toString(),
        dmlTextBlock.toJson().toString(),
      );
    });

    test('MLTextElement', () async {
      MLTextElement mlTextElement = MLTextElement()
        ..id = 1
        ..cornerPoints = CornerPoints.fromCornerPoints([
          const m.Point(1, 2),
          const m.Point(2, 1),
          const m.Point(1, 5),
          const m.Point(6, 2),
        ])
        ..detectedElementTextID = 1
        ..lineID = 1
        ..lineIndex = 1
        ..photoID = 1
        ..userFeedback = true;
      String json = jsonEncode(mlTextElement);

      MLTextElement dmlTextElement = MLTextElement().fromJson(jsonDecode(json));
      expect(
        dmlTextElement.toJson().toString(),
        mlTextElement.toJson().toString(),
      );
    });

    test('MLTextLine', () async {
      MLTextLine mlTextLine = MLTextLine()
        ..id = 1
        ..blockID = 1
        ..blockIndex = 1
        ..cornerPoints = CornerPoints.fromCornerPoints([
          const m.Point(1, 2),
          const m.Point(2, 1),
          const m.Point(1, 5),
          const m.Point(6, 2),
        ])
        ..recognizedLanguages = ['aa', 'za'];
      String json = jsonEncode(mlTextLine);

      MLTextLine dmlTextLine = MLTextLine().fromJson(jsonDecode(json));
      expect(
        dmlTextLine.toJson().toString(),
        mlTextLine.toJson().toString(),
      );
    });

    test('ObjectLabel', () async {
      ObjectLabel objectLabel = ObjectLabel()
        ..id = 1
        ..objectID = 1
        ..tagTextID = 1;
      String json = jsonEncode(objectLabel);

      ObjectLabel dobjectLabel = ObjectLabel().fromJson(jsonDecode(json));
      expect(
        dobjectLabel.toJson().toString(),
        objectLabel.toJson().toString(),
      );
    });

    test('Photo', () async {
      Photo photo = Photo()
        ..id = 1
        ..containerUID = 'containerUID'
        ..extention = 'extention'
        ..photoName = 1234
        ..photoSize = EmbeddedSize.fromSize(const Size(1, 1))
        ..thumbnailExtention = 'thumbnailExtention'
        ..thumbnailName = 'thumbnailName';
      String json = jsonEncode(photo);

      Photo dphoto = Photo().fromJson(jsonDecode(json));

      expect(
        dphoto.toJson().toString(),
        photo.toJson().toString(),
      );
    });

    test('PhotoLabel', () async {
      PhotoLabel photoLabel = PhotoLabel()
        ..id = 1
        ..photoID = 1
        ..tagTextID = 1;
      String json = jsonEncode(photoLabel);

      PhotoLabel dphotoLabel = PhotoLabel().fromJson(jsonDecode(json));
      expect(
        dphotoLabel.toJson().toString(),
        photoLabel.toJson().toString(),
      );
    });

    test('TagText', () async {
      TagText tagText = TagText()
        ..id = 1
        ..text = 'text';
      String json = jsonEncode(tagText);
      TagText dtagText = TagText().fromJson(jsonDecode(json));
      expect(
        dtagText.toJson().toString(),
        tagText.toJson().toString(),
      );
    });
  });
}
