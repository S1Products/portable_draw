// Copyright 2020 Miura Acoustic
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:portable_draw/definitions/canvas.dart';
import 'package:portable_draw/io/file_util.dart';

class JsonReader {

  Future<CanvasDef> readFromTemp(String filePath) async {

    final file = await FileUtil.getFileFromTempPath(filePath);
    return readFromFile(file);
  }

  Future<CanvasDef> readFromAppDocument(String filePath) async {

    final file = await FileUtil.getFileFromAppDocumentPath(filePath);
    return readFromFile(file);
  }

  Future<CanvasDef> readFromAssets(String filePath) async {

    final jsonString = await rootBundle.loadString(filePath);
    var jsonData = json.decode(jsonString);
    return CanvasDef.fromJson(jsonData);
  }

  Future<CanvasDef> readFromFile(File file) async {

    final jsonString = await file.readAsString();
    var jsonData = json.decode(jsonString);
    return CanvasDef.fromJson(jsonData);
  }
}