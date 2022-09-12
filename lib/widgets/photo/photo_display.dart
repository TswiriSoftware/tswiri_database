import 'dart:io';
import 'package:flutter/material.dart';

class PhotoDisplayWidget extends StatelessWidget {
  const PhotoDisplayWidget({
    Key? key,
    required this.photoPath,
    this.height,
    this.width,
  }) : super(key: key);

  ///File path of the photo.
  final String photoPath;

  ///The width of the displayed photo.
  final double? width;

  ///The height of the displayed photo.
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.file(
        File(photoPath),
        fit: BoxFit.scaleDown,
        height: height,
        width: width,
      ),
    );
  }
}
