import 'package:isar/isar.dart';
import 'package:tswiri_database/src/collections/essential/photo/photo.dart';
import 'package:tswiri_database/src/collections/essential/tag_text/tag_text.dart';
part 'photo_label.g.dart';

///[PhotoLabel]
///
///  - `id` the id of `this`.
///  - `photoID` The [Photo]'s ID `this` is linked to.
///  - `tagTextID` The [TagText]'s ID `this` is linked to.
///
@Collection()
@Name("PhotoLabel")
class PhotoLabel {
  Id id = Isar.autoIncrement;

  @Name('uid')
  @Index(unique: true)
  late String uid;

  @Name("photoUID")
  late String photoUID;

  @Name("tagTextUID")
  @Index()
  late String tagTextUID;

  @override
  bool operator ==(Object other) {
    return other is PhotoLabel &&
        id == other.id &&
        photoUID == other.photoUID &&
        tagTextUID == other.tagTextUID;
  }

  @override
  String toString() {
    return 'photoID: $photoUID, textID: $tagTextUID';
  }

  Map toJson() => {
        'id': id,
        'uid': uid,
        'tagID': photoUID,
        'textID': tagTextUID,
      };

  PhotoLabel fromJson(Map<String, dynamic> json) {
    return PhotoLabel()
      ..id = json['id']
      ..uid = json['uid']
      ..photoUID = json['tagID']
      ..tagTextUID = json['textID'];
  }

  @override
  int get hashCode => id.hashCode;
}
