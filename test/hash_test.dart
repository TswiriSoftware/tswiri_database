import 'dart:convert';
import 'dart:developer';
import 'dart:math' as m;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tswiri_database/export.dart';
import 'package:vector_math/vector_math_64.dart' as vm;

void main() {
  group('Hash: ', () {
    test('BarcodeBatch', () async {
      List<BarcodeBatch> list = [
        BarcodeBatch()
          ..id = 1
          ..height = 20
          ..width = 20
          ..imported = false
          ..rangeEnd = 10
          ..rangeStart = 1
          ..timestamp = 9999,
        BarcodeBatch()
          ..id = 2
          ..height = 25
          ..width = 25
          ..imported = true
          ..rangeEnd = 15
          ..rangeStart = 12
          ..timestamp = 999999,
      ];

      // log(jsonEncode(list).hashCode.toString()); // 813925921

      expect(
        jsonEncode(list).hashCode,
        813925921,
      );
    });

    test('CameraCalibrationEntry', () async {
      List<CameraCalibrationEntry> list = [
        CameraCalibrationEntry()
          ..id = 1
          ..diagonalSize = 20
          ..distanceFromCamera = 20,
        CameraCalibrationEntry()
          ..id = 2
          ..diagonalSize = 40
          ..distanceFromCamera = 40
      ];

      // log(jsonEncode(list).hashCode.toString()); // 564888452

      expect(
        jsonEncode(list).hashCode,
        564888452,
      );
    });

    test('CatalogedBarcode', () async {
      List<CatalogedBarcode> list = [
        CatalogedBarcode()
          ..id = 1
          ..barcodeUID = 'barcodeUID'
          ..batchID = 1
          ..height = 20
          ..width = 20,
        CatalogedBarcode()
          ..id = 2
          ..barcodeUID = 'barcodeUID123'
          ..batchID = 2
          ..height = 40
          ..width = 40
      ];

      // log(jsonEncode(list).hashCode.toString()); // 98945548

      expect(
        jsonEncode(list).hashCode,
        98945548,
      );
    });

    test('CatalogedContainer', () async {
      List<CatalogedContainer> list = [
        CatalogedContainer()
          ..id = 1
          ..barcodeUID = 'barcodeUID'
          ..containerUID = 'containerUID'
          ..description = 'description'
          ..name = 'name'
          ..containerTypeID = 1,
        CatalogedContainer()
          ..id = 2
          ..barcodeUID = 'barcodeUID1'
          ..containerUID = 'containerUID1'
          ..description = 'description1'
          ..name = 'name1'
          ..containerTypeID = 2,
      ];

      // log(jsonEncode(list).hashCode.toString()); // 151889385

      expect(
        jsonEncode(list).hashCode,
        151889385,
      );
    });

    test('CatalogedCoordinate', () async {
      List<CatalogedCoordinate> list = [
        CatalogedCoordinate()
          ..id = 1
          ..barcodeUID = 'barcodeUID'
          ..coordinate = vm.Vector3(0, 0, 0)
          ..gridUID = 1
          ..rotation = vm.Vector3(0, 0, 0)
          ..timestamp = 9999,
        CatalogedCoordinate()
          ..id = 2
          ..barcodeUID = 'barcodeUID1'
          ..coordinate = vm.Vector3(10, 10, 10)
          ..gridUID = 2
          ..rotation = vm.Vector3(5, 5, 5)
          ..timestamp = 9999,
      ];

      // log(jsonEncode(list).hashCode.toString()); // 756108172

      expect(
        jsonEncode(list).hashCode,
        756108172,
      );
    });

    test('CatalogedGrid', () async {
      List<CatalogedGrid> list = [
        CatalogedGrid()
          ..id = 1
          ..barcodeUID = 'barcodeUID'
          ..parentBarcodeUID = 'parentBarcodeUID',
        CatalogedGrid()
          ..id = 2
          ..barcodeUID = 'barcodeUID123'
          ..parentBarcodeUID = 'parentBarcodeUID123',
      ];
      // log(jsonEncode(list).hashCode.toString()); // 400689124

      expect(
        jsonEncode(list).hashCode,
        400689124,
      );
    });

    test('ContainerRelationship', () async {
      List<ContainerRelationship> list = [
        ContainerRelationship()
          ..id = 1
          ..containerUID = 'containerUID'
          ..parentUID = 'parentUID',
        ContainerRelationship()
          ..id = 2
          ..containerUID = 'containerUID123'
          ..parentUID = 'parentUID123',
      ];
      // log(jsonEncode(list).hashCode.toString()); // 126073858

      expect(
        jsonEncode(list).hashCode,
        126073858,
      );
    });

    test('ContainerTag', () async {
      List<ContainerTag> list = [
        ContainerTag()
          ..id = 1
          ..containerUID = 'containerUID'
          ..tagTextID = 1,
        ContainerTag()
          ..id = 2
          ..containerUID = 'containerUI123D'
          ..tagTextID = 2,
      ];
      // log(jsonEncode(list).hashCode.toString()); // 993451392

      expect(
        jsonEncode(list).hashCode,
        993451392,
      );
    });

    test('ContainerType', () async {
      List<ContainerType> list = [
        ContainerType()
          ..id = 1
          ..canContain = [1, 2]
          ..containerColor = const Color.fromARGB(255, 190, 37, 26)
          ..containerDescription = ''
          ..containerTypeName = ''
          ..enclosing = false
          ..iconData = Icons.dangerous
          ..moveable = false
          ..preferredChildContainer = 1,
        ContainerType()
          ..id = 2
          ..canContain = [3, 4]
          ..containerColor = const Color.fromARGB(255, 12, 12, 26)
          ..containerDescription = 'daszfw'
          ..containerTypeName = 'asfas'
          ..enclosing = true
          ..iconData = Icons.dangerous
          ..moveable = true
          ..preferredChildContainer = 2,
      ];
      // log(jsonEncode(list).hashCode.toString()); // 946399457

      expect(
        jsonEncode(list).hashCode,
        946399457,
      );
    });

    test('Marker', () async {
      List<Marker> list = [
        Marker()
          ..id = 1
          ..barcodeUID = 'barcodeUID'
          ..containerUID = 'containerUID',
        Marker()
          ..id = 2
          ..barcodeUID = 'baasdrcodeUID'
          ..containerUID = 'contaasdinerUID',
      ];
      // log(jsonEncode(list).hashCode.toString()); // 204334109

      expect(
        jsonEncode(list).hashCode,
        204334109,
      );
    });

    test('MLDetectedLabelText', () async {
      List<MLDetectedLabelText> list = [
        MLDetectedLabelText()
          ..id = 1
          ..detectedLabelText = 'detectedLabelText'
          ..hidden = false,
        MLDetectedLabelText()
          ..id = 2
          ..detectedLabelText = 'deteasdfctedLabelText'
          ..hidden = true,
      ];
      // log(jsonEncode(list).hashCode.toString()); // 775753302

      expect(
        jsonEncode(list).hashCode,
        775753302,
      );
    });

    test('MLPhotoLabel', () async {
      List<MLPhotoLabel> list = [
        MLPhotoLabel()
          ..id = 1
          ..confidence = 0.5
          ..detectedLabelTextID = 1
          ..photoID = 1
          ..userFeedback = true,
        MLPhotoLabel()
          ..id = 2
          ..confidence = 0.9
          ..detectedLabelTextID = 1234
          ..photoID = 2
          ..userFeedback = false,
      ];
      // log(jsonEncode(list).hashCode.toString()); // 225128185

      expect(
        jsonEncode(list).hashCode,
        225128185,
      );
    });

    test('MLObject', () async {
      List<MLObject> list = [
        MLObject()
          ..id = 1
          ..boundingBox = [0, 10, 10, 10]
          ..photoID = 1,
        MLObject()
          ..id = 2
          ..boundingBox = [20, 10, 10, 10]
          ..photoID = 5,
      ];
      // log(jsonEncode(list).hashCode.toString()); // 775851174

      expect(
        jsonEncode(list).hashCode,
        775851174,
      );
    });

    test('MLObjectLabel', () async {
      List<MLObjectLabel> list = [
        MLObjectLabel()
          ..id = 1
          ..confidence = 0.5
          ..detectedLabelTextID = 1
          ..objectID = 1
          ..userFeedback = true,
        MLObjectLabel()
          ..id = 2
          ..confidence = 0.6
          ..detectedLabelTextID = 112
          ..objectID = 14
          ..userFeedback = false,
      ];
      // log(jsonEncode(list).hashCode.toString()); // 345289780

      expect(
        jsonEncode(list).hashCode,
        345289780,
      );
    });

    test('MLDetectedElementText', () async {
      List<MLDetectedElementText> list = [
        MLDetectedElementText()
          ..id = 1
          ..detectedText = 'detectedText'
          ..tagTextID = 1,
        MLDetectedElementText()
          ..id = 2
          ..detectedText = 'detecteasdfdText'
          ..tagTextID = 5,
      ];
      // log(jsonEncode(list).hashCode.toString()); // 745568624

      expect(
        jsonEncode(list).hashCode,
        745568624,
      );
    });

    test('MLTextBlock', () async {
      List<MLTextBlock> list = [
        MLTextBlock()
          ..id = 1
          ..cornerPoints = [
            m.Point(1, 2),
            m.Point(2, 1),
            m.Point(1, 5),
            m.Point(6, 2),
          ]
          ..recognizedLanguages = ['aa', 'za'],
        MLTextBlock()
          ..id = 1
          ..cornerPoints = [
            m.Point(1, 5),
            m.Point(2, 1),
            m.Point(1, 3),
            m.Point(6, 2),
          ]
          ..recognizedLanguages = ['aa', 'za'],
      ];
      // log(jsonEncode(list).hashCode.toString()); // 920060633

      expect(
        jsonEncode(list).hashCode,
        920060633,
      );
    });

    test('MLTextElement', () async {
      List<MLTextElement> list = [
        MLTextElement()
          ..id = 1
          ..cornerPoints = [
            m.Point(1, 2),
            m.Point(2, 1),
            m.Point(1, 5),
            m.Point(6, 2),
          ]
          ..detectedElementTextID = 1
          ..lineID = 1
          ..lineIndex = 1
          ..photoID = 1
          ..userFeedback = true,
        MLTextElement()
          ..id = 1
          ..cornerPoints = [
            m.Point(1, 2),
            m.Point(2, 1),
            m.Point(1, 5),
            m.Point(6, 2),
          ]
          ..detectedElementTextID = 1
          ..lineID = 1
          ..lineIndex = 1
          ..photoID = 1
          ..userFeedback = true,
      ];
      // log(jsonEncode(list).hashCode.toString()); // 206095247

      expect(
        jsonEncode(list).hashCode,
        206095247,
      );
    });

    test('MLTextLine', () async {
      List<MLTextLine> list = [
        MLTextLine()
          ..id = 1
          ..blockID = 1
          ..blockIndex = 1
          ..cornerPoints = [
            m.Point(1, 2),
            m.Point(2, 1),
            m.Point(1, 5),
            m.Point(6, 2),
          ]
          ..recognizedLanguages = ['aa', 'za'],
        MLTextLine()
          ..id = 1
          ..blockID = 1
          ..blockIndex = 1
          ..cornerPoints = [
            m.Point(1, 2),
            m.Point(2, 1),
            m.Point(1, 5),
            m.Point(6, 2),
          ]
          ..recognizedLanguages = ['aa', 'za'],
      ];
      // log(jsonEncode(list).hashCode.toString()); // 267911113

      expect(
        jsonEncode(list).hashCode,
        267911113,
      );
    });

    test('ObjectLabel', () async {
      List<ObjectLabel> list = [
        ObjectLabel()
          ..id = 1
          ..objectID = 1
          ..tagTextID = 1,
        ObjectLabel()
          ..id = 1
          ..objectID = 1
          ..tagTextID = 1,
      ];
      // log(jsonEncode(list).hashCode.toString()); // 726314951

      expect(
        jsonEncode(list).hashCode,
        726314951,
      );
    });

    test('Photo', () async {
      List<Photo> list = [
        Photo()
          ..id = 1
          ..containerUID = 'containerUID'
          ..extention = 'extention'
          ..photoName = 1234
          ..photoSize = const Size(1, 1)
          ..thumbnailExtention = 'thumbnailExtention'
          ..thumbnailName = 'thumbnailName',
        Photo()
          ..id = 1
          ..containerUID = 'containerUID'
          ..extention = 'extention'
          ..photoName = 1234
          ..photoSize = const Size(1, 1)
          ..thumbnailExtention = 'thumbnailExtention'
          ..thumbnailName = 'thumbnailName',
      ];
      // log(jsonEncode(list).hashCode.toString()); // 387778109

      expect(
        jsonEncode(list).hashCode,
        387778109,
      );
    });

    test('PhotoLabel', () async {
      List<PhotoLabel> list = [
        PhotoLabel()
          ..id = 1
          ..photoID = 1
          ..tagTextID = 1,
        PhotoLabel()
          ..id = 1
          ..photoID = 1
          ..tagTextID = 1,
      ];
      // log(jsonEncode(list).hashCode.toString()); // 726314951

      expect(
        jsonEncode(list).hashCode,
        726314951,
      );
    });

    test('TagText', () async {
      List<TagText> list = [
        TagText()
          ..id = 1
          ..text = 'text',
        TagText()
          ..id = 2
          ..text = 'text1',
      ];
      // log(jsonEncode(list).hashCode.toString()); // 418988894

      expect(
        jsonEncode(list).hashCode,
        418988894,
      );
    });
  });
}
