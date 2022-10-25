import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tswiri_database/models/search/search_result_models.dart';
import 'package:tswiri_database/models/search/shopping_cart.dart';
import 'package:tswiri_database/widgets/search/text_painter.dart';
import 'dart:ui' as ui;
import 'image_painter.dart';

///Displays NameResult.
class NameResultCard extends StatelessWidget {
  const NameResultCard({
    Key? key,
    required this.nameResult,
    required this.backgroundColor,
    required this.chipColor,
  }) : super(key: key);
  final NameResult nameResult;
  final Color chipColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Chip(
            backgroundColor: chipColor,
            shape: StadiumBorder(
              side: BorderSide(
                color: chipColor,
              ),
            ),
            label: Text(
              nameResult.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ShoppingCartIconButton(
            containerUID: nameResult.containerUID,
            item: nameResult,
          ),
        ],
      ),
    );
  }
}

class ShoppingCartIconButton extends StatelessWidget {
  const ShoppingCartIconButton({
    Key? key,
    required this.containerUID,
    required this.item,
  }) : super(key: key);
  final String containerUID;
  final Result item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Provider.of<ShoppingCart>(context)
                      .itemList
                      .any((element) => element.uid == item.uid)
                  ? IconButton(
                      onPressed: () {
                        Provider.of<ShoppingCart>(context, listen: false)
                            .removeItem(item);
                      },
                      icon: const Icon(
                        Icons.remove_shopping_cart_sharp,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        Provider.of<ShoppingCart>(context, listen: false)
                            .addItem(item);
                      },
                      icon: const Icon(
                        Icons.add_shopping_cart,
                      ),
                    ),
            ),
          ],
        )
      ],
    );
  }
}

///Displays DescriptionResult.
class DescriptionResultCard extends StatelessWidget {
  const DescriptionResultCard({
    Key? key,
    required this.descriptionResult,
    required this.backgroundColor,
    required this.chipColor,
  }) : super(key: key);
  final DescriptionResult descriptionResult;
  final Color chipColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Chip(
            backgroundColor: chipColor,
            label: Text(
              descriptionResult.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ShoppingCartIconButton(
            containerUID: descriptionResult.containerUID,
            item: descriptionResult,
          ),
        ],
      ),
    );
  }
}

///Displays ContainerTagResult.
class ContainerTagResultCard extends StatelessWidget {
  const ContainerTagResultCard({
    Key? key,
    required this.containerTagResult,
    required this.backgroundColor,
    required this.chipColor,
  }) : super(key: key);
  final ContainerTagResult containerTagResult;

  final Color chipColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Chip(
            backgroundColor: chipColor,
            label: Text(
              containerTagResult.tag,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ShoppingCartIconButton(
            containerUID: containerTagResult.containerUID,
            item: containerTagResult,
          ),
        ],
      ),
    );
  }
}

///Displays PhotoLabelResult.
class PhotoLabelResultCard extends StatelessWidget {
  const PhotoLabelResultCard({
    Key? key,
    required this.photoLabelResult,
    required this.backgroundColor,
    required this.chipColor,
  }) : super(key: key);
  final PhotoLabelResult photoLabelResult;
  final Color chipColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.file(
              File(photoLabelResult.photo.getPhotoPath()),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chip(
                backgroundColor: chipColor,
                label: Text(
                  photoLabelResult.photoLabel,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          ShoppingCartIconButton(
            containerUID: photoLabelResult.containerUID,
            item: photoLabelResult,
          ),
        ],
      ),
    );
  }
}

///Displays ObjectLabelResult.
class ObjectLabelResultCard extends StatelessWidget {
  const ObjectLabelResultCard({
    Key? key,
    required this.result,
    required this.backgroundColor,
    required this.chipColor,
  }) : super(key: key);
  final ObjectLabelResult result;
  final Color chipColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: [
          FutureBuilder<ui.Image>(
            future: getUiImage(result.photo.getPhotoPath()),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: CustomPaint(
                    size: const Size(100, 100),
                    painter: ImagePainter(
                      result.mlObject,
                      snapshot.data!,
                      result.photo.photoSize.size,
                    ),
                  ),
                );
              } else {
                return const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chip(
                backgroundColor: chipColor,
                label: Text(
                  result.objectLabel,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          ShoppingCartIconButton(
            containerUID: result.containerUID,
            item: result,
          ),
        ],
      ),
    );
  }
}

///Displays MLPhotoLabelResult.
class MLPhotoLabelResultCard extends StatelessWidget {
  const MLPhotoLabelResultCard({
    Key? key,
    required this.mlphotoLabelResult,
    required this.backgroundColor,
    required this.chipColor,
  }) : super(key: key);
  final MLPhotoLabelResult mlphotoLabelResult;
  final Color chipColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.file(
              File(mlphotoLabelResult.photo.getPhotoPath()),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chip(
                backgroundColor: chipColor,
                label: Text(
                  mlphotoLabelResult.mlPhotoLabel,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          ShoppingCartIconButton(
            containerUID: mlphotoLabelResult.containerUID,
            item: mlphotoLabelResult,
          ),
        ],
      ),
    );
  }
}

///Displays MLObjectLabelResult.
class MLObjectLabelResultCard extends StatelessWidget {
  const MLObjectLabelResultCard({
    Key? key,
    required this.result,
    required this.backgroundColor,
    required this.chipColor,
  }) : super(key: key);
  final MLObjectLabelResult result;
  final Color chipColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: [
          FutureBuilder<ui.Image>(
            future: getUiImage(result.photo.getPhotoPath()),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: CustomPaint(
                    size: const Size(150, 150),
                    painter: ImagePainter(
                      result.mlObject,
                      snapshot.data!,
                      result.photo.photoSize.size,
                    ),
                  ),
                );
              } else {
                return const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chip(
                backgroundColor: chipColor,
                label: Text(
                  result.mlObjectLabel,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          ShoppingCartIconButton(
            containerUID: result.containerUID,
            item: result,
          ),
        ],
      ),
    );
  }
}

///Displays MLTextElementResult.
class MLTextElementResultCard extends StatelessWidget {
  const MLTextElementResultCard({
    Key? key,
    required this.result,
    required this.backgroundColor,
    required this.chipColor,
  }) : super(key: key);
  final MLTextResult result;
  final Color chipColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: [
          FutureBuilder<ui.Image>(
            future: getUiImage(result.photo.getPhotoPath()),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: CustomPaint(
                    size: const Size(100, 100),
                    painter: MLTextPainter(
                      result.mlTextElement,
                      snapshot.data!,
                      result.photo.photoSize.size,
                    ),
                  ),
                );
              } else {
                return const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chip(
                backgroundColor: chipColor,
                label: Text(
                  result.mlText,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          ShoppingCartIconButton(
            containerUID: result.containerUID,
            item: result,
          ),
        ],
      ),
    );
  }
}

Future<ui.Image> getUiImage(String imageAssetPath) async {
  final decodedImage = File(imageAssetPath).readAsBytesSync();

  final codec = await ui.instantiateImageCodec(
    decodedImage,
  );

  return (await codec.getNextFrame()).image;
}
