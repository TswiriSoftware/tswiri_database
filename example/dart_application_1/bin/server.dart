import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:tswiri_database/desktop_database.dart';
import 'package:tswiri_database/tswiri_database.dart';

void main(List<String> args) async {
  isar = initiateDesktopIsar(directory: Directory('isar').path);
}
