import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tswiri_database/widgets/ml_label_paint/ml_label_paint.dart';

class PhotoDisplayWidget extends StatelessWidget {
  const PhotoDisplayWidget({
    Key? key,
    required this.photoPath,
    this.height,
    this.width,
    this.mlLabelPaint,
  }) : super(key: key);

  ///File path of the photo.
  final String photoPath;

  ///The width of the displayed photo.
  final double? width;

  ///The height of the displayed photo.
  final double? height;

  ///MLLabelPaint. required height and width.
  final MLLabelPaint? mlLabelPaint;

  @override
  Widget build(BuildContext context) {
    if (mlLabelPaint == null) {
      return Image.file(
        File(photoPath),
        fit: BoxFit.scaleDown,
        height: height,
        width: width,
      );
    } else {
      return Stack(
        fit: StackFit.expand,
        children: [
          Image.file(
            File(photoPath),
            fit: BoxFit.scaleDown,
            height: height,
            width: width,
          ),
          mlLabelPaint!,
        ],
      );
    }
  }
}
