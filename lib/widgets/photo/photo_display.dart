import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tswiri_database/widgets/ml_label_paint/ml_label_paint.dart';

class PhotoDisplay extends StatelessWidget {
  const PhotoDisplay({
    Key? key,
    required this.photoPath,
    this.height,
    this.width,
    this.mlLabelPaint,
    this.photoNavigation,
  }) : super(key: key);

  ///File path of the photo.
  final String photoPath;

  ///The width of the displayed photo.
  final double? width;

  ///The height of the displayed photo.
  final double? height;

  ///MLLabelPaint. required height and width.
  final MLLabelPaint? mlLabelPaint;

  ///Photo Navigation Widget
  final Widget? photoNavigation;

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
      return SizedBox(
        height: height ??
            0 / (width ?? 1 / (MediaQuery.of(context).size.width - 16)),
        child: Stack(
          alignment: AlignmentDirectional.center,
          fit: StackFit.expand,
          children: [
            Image.file(
              File(photoPath),
              fit: BoxFit.scaleDown,
            ),
            mlLabelPaint!,
            photoNavigation ?? const SizedBox.shrink(),
          ],
        ),
      );
    }
  }
}
