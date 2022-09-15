// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:tswiri_database/models/acclerometer/acceleromter_data.dart';
import 'package:vector_math/vector_math_64.dart' as vm;
import 'dart:ui';

class OnImageBarcodeData {
  OnImageBarcodeData({
    required this.barcodeUID,
    required this.onImageCornerPoints,
    required this.timestamp,
    required this.accelerometerData,
  });

  ///BarcodeUID.
  final String barcodeUID;

  final List<Offset> onImageCornerPoints;

  ///Timestamp.
  final int timestamp;

  ///Accelerometer Data.
  final AccelerometerData accelerometerData;

  int get comparableHashCode => onImageCornerPoints.hashCode;

  List toMessage() {
    return [
      barcodeUID, //BarcodeUID [0]
      [
        //On Image Points [1]
        onImageCornerPoints[0].dx, // Point1. x
        onImageCornerPoints[0].dy, // Point1. y
        onImageCornerPoints[1].dx, // Point2. x
        onImageCornerPoints[1].dy, // Point2. y
        onImageCornerPoints[2].dx, // Point3. x
        onImageCornerPoints[2].dy, // Point3. y
        onImageCornerPoints[3].dx, // Point4. x
        onImageCornerPoints[3].dy, // Point5. y
      ],
      [
        //AccelerometerData [2]
        accelerometerData.accelerometerEvent.x,
        accelerometerData.accelerometerEvent.y,
        accelerometerData.accelerometerEvent.z,
        accelerometerData.userAccelerometerEvent.x,
        accelerometerData.userAccelerometerEvent.y,
        accelerometerData.userAccelerometerEvent.z,
      ],
      timestamp //Timestamp [3]
    ];
  }

  ///Create a OnImageBarcodeData from a Message.
  factory OnImageBarcodeData.fromBarcodeData(List<dynamic> item) {
    List<Offset> onImageCornerPoints = [
      Offset(item[2][0] as double, item[2][1] as double),
      Offset(item[2][2] as double, item[2][3] as double),
      Offset(item[2][4] as double, item[2][5] as double),
      Offset(item[2][6] as double, item[2][7] as double),
    ];

    AccelerometerData accelerometerData = AccelerometerData(
        accelerometerEvent: vm.Vector3(
          item[3][0] as double,
          item[3][1] as double,
          item[3][2] as double,
        ),
        userAccelerometerEvent: vm.Vector3(
          item[3][3] as double,
          item[3][4] as double,
          item[3][5] as double,
        ));

    return OnImageBarcodeData(
      barcodeUID: item[0].toString(),
      onImageCornerPoints: onImageCornerPoints,
      accelerometerData: accelerometerData,
      timestamp: item[4],
    );
  }

  ///Create a OnImageBarcodeData from a Message.
  factory OnImageBarcodeData.fromMessage(List<dynamic> item) {
    List<Offset> onImageCornerPoints = [
      Offset(item[1][0] as double, item[1][1] as double),
      Offset(item[1][2] as double, item[1][3] as double),
      Offset(item[1][4] as double, item[1][5] as double),
      Offset(item[1][6] as double, item[1][7] as double),
    ];

    AccelerometerData accelerometerData = AccelerometerData(
        accelerometerEvent: vm.Vector3(
          item[2][0] as double,
          item[2][1] as double,
          item[2][2] as double,
        ),
        userAccelerometerEvent: vm.Vector3(
          item[2][3] as double,
          item[2][4] as double,
          item[2][5] as double,
        ));

    return OnImageBarcodeData(
      barcodeUID: item[0],
      onImageCornerPoints: onImageCornerPoints,
      timestamp: item[3],
      accelerometerData: accelerometerData,
    );
  }

  ///Calculate barcode centerPoint.
  Offset get barcodeCenterPoint {
    //Center of X coordinates.
    double centerX = (onImageCornerPoints[0].dx +
            onImageCornerPoints[1].dx +
            onImageCornerPoints[2].dx +
            onImageCornerPoints[3].dx) /
        4;

    //Center of Y coordinates.
    double centerY = (onImageCornerPoints[0].dy +
            onImageCornerPoints[1].dy +
            onImageCornerPoints[2].dy +
            onImageCornerPoints[3].dy) /
        4;
    return Offset(centerX, centerY);
  }

  double get barcodeDiagonalLength {
    double diagonal1 =
        (onImageCornerPoints[0] - onImageCornerPoints[2]).distance;
    double diagonal2 =
        (onImageCornerPoints[1] - onImageCornerPoints[3]).distance;

    return (diagonal1 + diagonal2) / 2;
  }

  @override
  String toString() {
    return '\nUID: $barcodeUID, timestamp: $timestamp, centerPoint: (${barcodeCenterPoint.dx}, ${barcodeCenterPoint.dy}), diagonalLength: $barcodeDiagonalLength)';
  }

  late List<double> corners = [
    onImageCornerPoints[0].dx,
    onImageCornerPoints[0].dy,
    onImageCornerPoints[1].dx,
    onImageCornerPoints[1].dy,
    onImageCornerPoints[2].dx,
    onImageCornerPoints[2].dy,
    onImageCornerPoints[3].dx,
    onImageCornerPoints[3].dy,
  ];

  Map<String, dynamic> toJson() => {
        'barcodeUID': barcodeUID,
        'onImageCornerPoints': jsonEncode(corners),
        'timestamp': timestamp,
        'accelerometerData': accelerometerData.toJson(),
      };

  factory OnImageBarcodeData.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> acceleromerter = json['accelerometerData'];

    List c = jsonDecode(json['onImageCornerPoints']);
    List<Offset> cornerPoints = [
      Offset(c[0] as double, c[1] as double),
      Offset(c[2] as double, c[3] as double),
      Offset(c[4] as double, c[5] as double),
      Offset(c[6] as double, c[7] as double),
    ];

    return OnImageBarcodeData(
        barcodeUID: json['barcodeUID'],
        onImageCornerPoints: cornerPoints,
        timestamp: json['timestamp'] as int,
        accelerometerData: AccelerometerData.fromJson(acceleromerter));
  }
}
