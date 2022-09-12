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

  final MLLabelPaint? mlLabelPaint;

  @override
  Widget build(BuildContext context) {
    if (mlLabelPaint == null) {
    } else {}
    return ClipRRect(
      // borderRadius: BorderRadius.circular(8),
      child: Image.file(
        File(photoPath),
        fit: BoxFit.scaleDown,
        height: height,
        width: width,
      ),
    );
  }
}
