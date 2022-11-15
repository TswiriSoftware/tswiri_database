library tswiri_database;

import 'dart:convert';
import 'dart:io';

import 'export.dart';

part 'functions/specific/create_container_types.dart';
part 'functions/comparisons/table_hashes.dart';
part 'functions/comparisons/database_hash_map.dart';
part 'collections/collection_names.dart';

// part 'functions/get';
part 'functions/get/get.dart';
part 'functions/get/get_barcode_batch.dart';
part 'functions/get/get_cataloged_barcode.dart';
part 'functions/get/get_cataloged_container.dart';
part 'functions/get/get_cataloged_coordinate.dart';
part 'functions/get/get_cataloged_grid.dart';
part 'functions/get/get_container_relationship.dart';
part 'functions/get/get_container_tag.dart';
part 'functions/get/get_container_type.dart';
part 'functions/get/get_marker.dart';
part 'functions/get/get_ml_detected_element_text.dart';
part 'functions/get/get_ml_detected_label_text.dart';
part 'functions/get/get_ml_object.dart';
part 'functions/get/get_ml_object_label.dart';
part 'functions/get/get_ml_photo_label.dart';
part 'functions/get/get_ml_text_block.dart';
part 'functions/get/get_ml_text_elements.dart';
part 'functions/get/get_ml_text_line.dart';
part 'functions/get/get_object_label.dart';
part 'functions/get/get_photo.dart';
part 'functions/get/get_photo_label.dart';
part 'functions/get/get_tag_text.dart';
part 'functions/get/get_camera_calibration_entries.dart';
part 'functions/get/filter_tag_text.dart';

// part 'functions/put';
part 'functions/put/put.dart';

// part 'functions/delete';
part 'functions/delete/delete.dart';

// part 'functions/specific';
part 'functions/specific/delete_cataloged_container.dart';
part 'functions/specific/delete_photo.dart';
part 'functions/specific/create_photo.dart';
part 'functions/specific/update_coordinates.dart';
part 'functions/specific/create_cataloged_container.dart';
part 'functions/specific/create_barcode_batch.dart';
part 'functions/specific/delete_barcode_batch.dart';
part 'functions/specific/create_new_grid.dart';
part 'functions/specific/delete_grid.dart';
part 'functions/specific/update_barcode_batch.dart';

part 'initializers/desktop_database.dart';
part 'initializers/mobile_database.dart';

///The folder where isar and photo files are stored.
Directory? spaceDirectory;

String isarDirectoryPref = 'isarDirectory';
Directory? isarDirectory;
Directory? photoDirectory;
Directory? thumbnailDirectory;

///Isar.
Isar? _isar;

Future<void> closeIsar() async {
  if (_isar!.isOpen) {
    _isar!.close();
  }
}
