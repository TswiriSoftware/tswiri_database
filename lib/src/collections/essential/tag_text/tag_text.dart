import 'package:isar/isar.dart';
part 'tag_text.g.dart';

///[TagText]
///
///  - `id` the id of `this`.
///  - `text` The text stored by `this`.
///
@Collection()
@Name("TagText")
class TagText {
  Id id = Isar.autoIncrement;

  @Name('uid')
  @Index(unique: true)
  late String uid;

  @Name("text")
  @Index(unique: true)
  late String text;

  @override
  String toString() {
    return 'tag: $text';
  }

  Map toJson() => {
        'id': id,
        'uid': uid,
        'tag': text,
      };

  TagText fromJson(Map<String, dynamic> json) {
    return TagText()
      ..id = json['id']
      ..uid = json['uid']
      ..text = json['tag'];
  }

  @override
  bool operator ==(Object other) {
    return other is TagText && id == other.id && text == other.text;
  }

  @override
  int get hashCode => id.hashCode;
}
