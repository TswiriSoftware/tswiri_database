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

  @Name('uid')
  @Index(unique: true)
  late String uid;

  @Name("containerUID")
  late String containerUID;

  @Name("photoName")
  late String photoName;

  @Name("photoExtention")
  late String photoExtention;

  @Name("thumbnailName")
  late String thumbnailName;

  @Name("thumbnailExtention")
  late String thumbnailExtention;

  @Name("photoSize")
  late List<double> photoSize;

  @override
  String toString() {
    return '\nID: $id, containerID: $containerUID ';
  }

  String getPhotoPath({String? directoryPath}) {
    if (directoryPath != null) {
      return '$directoryPath/$photoName.$photoExtention';
    } else {
      return '${photoDirectory!.path}/$photoName.$photoExtention';
    }
  }

  String getPhotoThumbnailPath({String? directoryPath}) {
    if (directoryPath != null) {
      return '$directoryPath/thumbnails/${photoName}__thumbnail.$photoExtention';
    } else {
      return '${thumbnailDirectory!.path}/${photoName}_thumbnail.$photoExtention';
    }
  }

  Map toJson() => {
        'id': id,
        'uid': uid,
        'containerUID': containerUID,
        'photoName': photoName,
        'extention': photoExtention,
        'thumbnailName': thumbnailName,
        'thumbnailExtention': thumbnailExtention,
        'photoSize': photoSize,
      };

  Photo fromJson(Map<String, dynamic> json) {
    List<double> size = (json['photoSize'] as List<dynamic>).cast<double>();
    return Photo()
      ..id = json['id']
      ..uid = json['uid']
      ..containerUID = json['containerUID']
      ..photoName = json['photoName'] as String
      ..photoExtention = json['extention']
      ..thumbnailName = json['thumbnailName']
      ..thumbnailExtention = json['thumbnailExtention']
      ..photoSize = size;
  }
}
