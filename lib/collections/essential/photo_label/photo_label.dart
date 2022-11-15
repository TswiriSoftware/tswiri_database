import 'package:isar/isar.dart';
import 'package:tswiri_database/collections/essential/photo/photo.dart';
import 'package:tswiri_database/collections/essential/tag_text/tag_text.dart';
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

  ///Photo ID.
  @Name("photoID")
  late int photoID;

  ///The text tag.
  @Name("tagTextID")
  @Index()
  late int tagTextID;

  @override
  bool operator ==(Object other) {
    return other is PhotoLabel &&
        id == other.id &&
        photoID == other.photoID &&
        tagTextID == other.tagTextID;
  }

  @override
  String toString() {
    return 'photoID: $photoID, textID: $tagTextID';
  }

  Map toJson() => {'id': id, 'tagID': photoID, 'textID': tagTextID};

  PhotoLabel fromJson(Map<String, dynamic> json) {
    return PhotoLabel()
      ..id = json['id']
      ..photoID = json['tagID']
      ..tagTextID = json['textID'];
  }

  @override
  int get hashCode => id.hashCode;
}
