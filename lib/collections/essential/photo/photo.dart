import 'package:isar/isar.dart';
import 'package:tswiri_database/tswiri_database.dart';
import 'package:tswiri_database/collections/essential/cataloged_container/cataloged_container.dart';
part 'photo.g.dart';

///[Photo]
///
///  - `id` the id of `this`.
///  - `containerUID` The [CatalogedContainer]'s UID `this` is linked to.
///  - `photoName` The photoName of `this`.
///  - `extention` The photoExtention of `this`.
///  - `thumbnailName` The thumbnailName of `this`.
///  - `thumbnailExtention` The thumbnailExtention of `this`.
///  - `photoSize` The photoSize of `this`.
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
  ///[width, height]
  @Name("photoSize")
  late List<double> photoSize;

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

  // Size getPhotoSize() {
  //   File imageFile = File(getPhotoPath());
  //   img.Image image = img.decodeImage(imageFile.readAsBytesSync())!;
  //   return Size(image.width.toDouble(), image.height.toDouble());
  // }

  Map toJson() => {
        'id': id,
        'containerUID': containerUID,
        'photoName': photoName,
        'extention': extention,
        'thumbnailName': thumbnailName,
        'thumbnailExtention': thumbnailExtention,
        'photoSize': photoSize,
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
      ..photoSize = size;
  }
}
