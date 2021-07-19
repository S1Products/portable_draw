// Copyright 2020 Miura Acoustic
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileUtil {

  static Future<String> getTempPath() async {

    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  static Future<File> getFileFromTempPath(String filePath) async {
    final path = await getTempPath();
    return File('$path/$filePath');
  }

  static Future<String> getAppDocumentPath() async {

    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> getFileFromAppDocumentPath(String filePath) async {
    final path = await getAppDocumentPath();
    return File('$path/$filePath');
  }
}