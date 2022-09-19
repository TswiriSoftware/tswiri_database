import 'package:tswiri_database/collections/tag_text/tag_text.dart';

///The basic TagTextController.
class TagTextController {
  TagTextController({
    required this.assignedTags,
  });

  ///The list of assigned tags.
  List<TagText> assignedTags;

  ///The list of tags to display.
  List<TagText> displayTags = [];

  ///Add a new tag to assigned tags.
  void addTag(TagText tagText) {
    //TODO:
  }

  ///Remove an assigned tag.
  void removeTag(TagText tagText) {
    //TODO:
  }
}
