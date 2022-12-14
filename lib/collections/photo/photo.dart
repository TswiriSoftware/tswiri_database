import 'dart:io';
import 'dart:ui';
import 'package:tswiri_database/export.dart';
import 'package:image/image.dart' as img;
part 'photo.g.dart';

///TODO: finish commenting.

///Stores details about a container (Created by user).
///
///  - ```containerUID``` Unique identifier.
///  - ```containerTypeID``` Type of container [ContainerType].
///  - ```name``` Name of the container.
///  - ```description``` Description of the container.
///  - ```barcodeUID``` Barcode linked to this container.
///
@Collection()
@Name("Photo")
class Photo {
  ///ID.
  int id = Isar.autoIncrement;

  ///ContainerUID.
  @Name("containerUID")
  late String? containerUID;

  ///Photo Name.
  @Name("photoName")
  late int photoName;

  ///Photo Extention.
  @Name("extention")
  late String extention;

  ///Thumbnail Name.
  @Name("thumbnailName")
  late String thumbnailName;

  ///Thumbnail Extention.
  @Name("thumbnailExtention")
  late String thumbnailExtention;

  ///Photo Size.
  @Name("photoSize")
  @SizeConverter()
  late Size photoSize;

  @override
  String toString() {
    return '\nID: $id, containerID: $containerUID ';
  }

  String getPhotoPath({String? directoryPath}) {
    if (directoryPath != null) {
      return '$directoryPath/$photoName.$extention';
    } else {
      return '${photoDirectory!.path}/$photoName.$extention';
    }
  }

  String getPhotoThumbnailPath({String? directoryPath}) {
    if (directoryPath != null) {
      return '$directoryPath/thumbnails/${photoName}__thumbnail.$extention';
    } else {
      return '${thumbnailDirectory!.path}/${photoName}_thumbnail.$extention';
    }
  }

  Size getPhotoSize() {
    File imageFile = File(getPhotoPath());
    img.Image image = img.decodeImage(imageFile.readAsBytesSync())!;
    return Size(image.width.toDouble(), image.height.toDouble());
  }

  Map toJson() => {
        'id': id,
        'containerUID': containerUID,
        'photoName': photoName,
        'extention': extention,
        'thumbnailName': thumbnailName,
        'thumbnailExtention': thumbnailExtention,
        'photoSize': [photoSize.width, photoSize.height],
      };

  Photo fromJson(Map<String, dynamic> json) {
    List<double> size = (json['photoSize'] as List<dynamic>).cast<double>();
    return Photo()
      ..id = json['id']
      ..containerUID = json['containerUID']
      ..photoName = json['photoName'] as int
      ..extention = json['extention']
      ..thumbnailName = json['thumbnailName']
      ..thumbnailExtention = json['thumbnailExtention']
      ..photoSize = Size(size[0], size[1]);
  }
}

class SizeConverter extends TypeConverter<Size, List<double>> {
  const SizeConverter(); // Converters need to have an empty const constructor

  @override
  Size fromIsar(List<double> object) {
    return Size(object[0], object[1]);
  }

  @override
  List<double> toIsar(Size object) {
    return [
      object.width,
      object.height,
    ];
  }
}
