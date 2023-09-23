import 'dart:developer' show log;
import 'dart:io';

import 'package:path/path.dart' as p;

class FilesRepository {
  Future<void> sync(String from, String to) async {
    if (!await Directory(from).exists()) {
      log('$from does not exist');
      return;
    }

    if (await Directory(to).exists()) {
      await Directory(to).delete(recursive: true);
    }

    // copyPath(from, to);
    // https://pub.dev/documentation/io/latest/io/copyPath.html
    await Directory(to).create(recursive: true);
    await for (final file in Directory(from).list(recursive: true)) {
      final copyTo = p.join(to, p.relative(file.path, from: from));
      if (file is Directory) {
        await Directory(copyTo).create(recursive: true);
      } else if (file is File) {
        await File(file.path).copy(copyTo);
      } else if (file is Link) {
        await Link(copyTo).create(await file.target(), recursive: true);
      }
    }
  }
}
