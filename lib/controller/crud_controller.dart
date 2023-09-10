import 'package:taller_inicial/mvc.dart';

abstract class Create<T> {
  bool create({required T model});
}

abstract class Read<T> {
  List<T> read();
}

abstract class Update<T> {
  bool update({required String code, required T model});
}

abstract class Delete {
  bool delete({required String code});
}

class CrudController
    implements Create<Student>, Read<Student>, Update<Student>, Delete {
  List<Student> students;

  final String filePath;
  final FileController _fileController;

  CrudController({
    this.students = const [],
    required this.filePath,
  }) : _fileController = FileController();

  @override
  bool create({required Student model}) {
    try {
      students.add(model);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  bool delete({required String code}) {
    try {
      students.removeWhere((element) => element.code == code);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  List<Student> read() {
    try {
      students = _fileController.read(path: filePath);
      return students;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  bool update({
    required String code,
    required Student model,
  }) {
    try {
      students.removeWhere((student) => student.code == code);
      students.add(model);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> saveAll() async {
    try {
      _fileController.clear(path: filePath);

      for (var student in students) {
        await _fileController.save(student: student, path: filePath);
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
