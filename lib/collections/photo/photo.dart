import 'dart:io';
import 'dart:ui';
import 'package:isar/isar.dart';
import 'package:tswiri_database/embedded/embedded_size/embedded_size.dart';
import 'package:image/image.dart' as img;
import 'package:tswiri_database/tswiri_database.dart';
part 'photo.g.dart';

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
  Id id = Isar.autoIncrement;

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
  late EmbeddedSize photoSize;

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
        'photoSize': photoSize.data,
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
      ..photoSize = EmbeddedSize.fromMessage(size);
  }
}
