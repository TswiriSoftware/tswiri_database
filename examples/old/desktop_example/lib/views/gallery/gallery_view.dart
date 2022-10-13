import 'dart:developer';
import 'dart:io';

import 'package:desktop_example/views/photo/photo_edit_view.dart';
import 'package:flutter/material.dart';
import 'package:tswiri_database/export.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({Key? key}) : super(key: key);

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  late final List<Photo> _photos = isar!.photos.where().findAllSync();

  bool showObjects = true;
  bool showText = false;

  bool isAddingPhotoLabel = false;
  bool isAddingObjectLabel = false;

  int? selectedPhotoIndex;
  Photo? _photo;

  final GlobalKey<PhotoEditViewState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
        ),
        itemCount: _photos.length,
        itemBuilder: (context, index) {
          return _photoCard(_photos[index], index);
        },
      ),
    );
  }

  Widget _photoCard(Photo photo, int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PhotoEditView(
              selectedIndex: index,
              photos: _photos,
              navigationEnabeld: false,
            ),
          ),
        );
      },
      child: Center(
        child: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image.file(
                  width: 150,
                  height: 250,
                  File(photo.getPhotoThumbnailPath()),
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
