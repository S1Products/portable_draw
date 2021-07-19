// Copyright 2020 Miura Acoustic
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:convert';

import 'package:portable_draw/definitions/canvas.dart';
import 'package:portable_draw/io/file_util.dart';

class JsonWriter {

  Future<void> writeToTemp(CanvasDef canvasDef, String filePath) async {

    final file = await FileUtil.getFileFromTempPath(filePath);
    file.writeAsString(json.encode(canvasDef.toJson()));
  }

  Future<void> writeToAppDocument(CanvasDef canvasDef, String filePath) async {

    final file = await FileUtil.getFileFromAppDocumentPath(filePath);
    file.writeAsString(json.encode(canvasDef.toJson()));
  }
}