library tswiri_database;

import 'dart:convert';
import 'dart:io';

import 'embedded/embedded_color/embedded_color.dart';
import 'embedded/embedded_icon_data/embedded_icon_data.dart';
import 'export.dart';

part 'functions/specific/create_container_types.dart';
part 'functions/comparisons/table_hashes.dart';
part 'functions/comparisons/database_hash_map.dart';

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

// part 'functions/put';
part 'functions/put/put_marker.dart';
part 'functions/put/put_barcode_batch.dart';
part 'functions/put/put_new_barcode_batch.dart';
part 'functions/put/put_cataloged_container.dart';
part 'functions/put/put_container_type.dart';
part 'functions/put/put_container_tag.dart';
part 'functions/put/put_container_relationship.dart';
part 'functions/put/put_tag_text.dart';
part 'functions/put/put_ml_detected_label_text.dart';
part 'functions/put/put_ml_detected_element_text.dart';
part 'functions/put/put_camera_calibration_entry.dart';
part 'functions/put/put_photo.dart';
part 'functions/put/put_photo_label.dart';
part 'functions/put/put_cataloged_coordinate.dart';

// part 'functions/delete';
part 'functions/delete/delete_barcode_batch.dart';
part 'functions/delete/delete_container_tag.dart';
part 'functions/delete/delete_container_relationship.dart';

// part 'functions/specific';
part 'functions/specific/delete_container.dart';
part 'functions/specific/delete_photo.dart';
part 'functions/specific/filter_tag_text.dart';
part 'functions/specific/image_data.dart';
part 'functions/specific/grid_controller.dart';

part 'initializers/desktop_database.dart';
part 'initializers/mobile_database.dart';

///The folder where isar and photo files are stored.
Directory? spaceDirectory;

String isarDirectoryPref = 'isarDirectory';
Directory? isarDirectory;
Directory? photoDirectory;
Directory? thumbnailDirectory;

///Isar.
Isar? _isar; //TODO , get rid of this. '_'

Future<void> closeIsar() async {
  if (_isar!.isOpen) {
    _isar!.close();
  }
}




// TODO: Export any libraries intended for clients of this package.
