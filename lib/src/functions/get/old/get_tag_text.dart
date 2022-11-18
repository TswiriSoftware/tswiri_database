// import 'package:tswiri_database/src/collections/export.dart';

// ///default: null.
// ///
// ///id: Returns [TagText] matching id.
// TagText? getTagTextSync({
//   int? id,
//   String? text,
// }) {
//   if (id != null) {
//     return isar.tagTexts.getSync(id);
//   }

//   if (text != null) {
//     return isar.tagTexts
//         .filter()
//         .textMatches(text.toLowerCase().trim())
//         .findFirstSync();
//   }

//   return null;
// }

// ///Returns a list of [TagText] where the text contains the enteredKeyword
// List<TagText> getTagTextsThatContain({
//   required String enteredKeyword,
// }) {
//   return isar.tagTexts
//       .filter()
//       .textContains(enteredKeyword, caseSensitive: false)
//       .findAllSync();
// }

// ///Returns all [TagText] matching on the list of TagTextIDs
// List<TagText> getAllTagTexts({
//   required Set<int> tagTextIDs,
// }) {
//   return isar.tagTexts
//       .filter()
//       .allOf(tagTextIDs, (q, int element) => q.idEqualTo(element))
//       .findAllSync();
// }
