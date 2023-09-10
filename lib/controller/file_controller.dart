import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:taller_inicial/model/model.dart';

abstract class SaveFile {
  Future<bool> save({required Student student, required String path});
}

abstract class ReadFile<T> {
  List<T> read({required String path});
}

abstract class ClearFile {
  Future<bool> clear({required String path});
}

class FileController implements SaveFile, ReadFile<Student>, ClearFile {
  @override
  List<Student> read({required String path}) {
    try {
      final File file = File(path);
      final Uint8List bytes = file.readAsBytesSync();

      final List<String> lines = String.fromCharCodes(bytes)
          .trim()
          .replaceAll('ñ', 'n')
          .replaceAll('Ñ', 'N')
          .replaceAll('\n', '')
          .split('\r');

      return lines
          .map((student) => Student.fromRawString(student.split(',').asMap()))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<bool> save({required Student student, required String path}) async {
    try {
      final File file = File(path);

      await file.writeAsString(
        student.toRaw(),
        mode: FileMode.append,
        encoding: utf8,
        flush: true,
      );

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> clear({required String path}) async {
    try {
      final File file = File(path);

      await file.writeAsString('');

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
