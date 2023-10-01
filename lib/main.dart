import 'dart:developer' show log;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_saves_backup/core/ui/my_app.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  final defaultDirectory = p.join(dir.path, 'game_saves_backup');
  if (!await Directory(defaultDirectory).exists()) {
    await Directory(defaultDirectory).create(recursive: true);
  }
  Hive.defaultDirectory = defaultDirectory;
  log('Hive.defaultDirectory: ${Hive.defaultDirectory}');

  runApp(const ProviderScope(child: MyApp()));
}
