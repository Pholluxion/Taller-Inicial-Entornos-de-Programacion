import 'dart:convert';
import 'dart:io';

import 'package:taller_inicial/controller/controller.dart';
import 'package:taller_inicial/model/model.dart';

import 'view.dart';

class View {
  final InfoController infoController;
  final CrudController crudController;

  View({required this.infoController, required this.crudController});

  Future<void> init(String filePath) async {
    final studentTableView = StudentTableView();
    final cityReportTableView = CityReportTableView();
    final genreReportTableView = GenreReportTableView();
    final groupReportTableView = GroupReportTableView();

    while (true) {
      final list = crudController.students;

      final cityReport = infoController.cityReport(list);
      final genreReport = infoController.genreReport(list);
      final groupReport = infoController.groupReport(list);

      showPrimaryMenu();

      var line = stdin.readLineSync(encoding: utf8);

      if (line == 'a') {
        //TODO: Refactor
        clear();
        print(studentTableView.paintHeader());
        list.asMap().entries.forEach((student) {
          print(studentTableView.paintRow(student.value));
        });
        await Future.delayed(const Duration(seconds: 10));
      }

      if (line == 'b') {
        //TODO: Refactor
        clear();
        print(cityReportTableView.paintHeader());
        print(cityReportTableView.paintRow(cityReport));

        print(genreReportTableView.paintHeader());
        print(genreReportTableView.paintRow(genreReport));

        print(groupReportTableView.paintHeader());
        print(groupReportTableView.paintRow(groupReport));
        await Future.delayed(const Duration(seconds: 10));
      }

      if (line == 'c') {
        //TODO: Refactor
        secondaryLoop();
      }

      if (line == 'd') {
        //TODO: Refactor
        crudController.saveAll();
        break;
      }
    }
  }

  Future<void> secondaryLoop() async {
    while (true) {
      showSecondaryMenu();

      var line = stdin.readLineSync(encoding: utf8);

      if (line == 'a') {
        //TODO: Refactor

        print('Crear registro');
        print('Digita el codigo: ');
        var code = stdin.readLineSync(encoding: utf8);
        print('Digita el nombre: ');
        var name = stdin.readLineSync(encoding: utf8);
        print('Digita la edad: ');
        var age = stdin.readLineSync(encoding: utf8);
        cityMenu();
        var city = stdin.readLineSync(encoding: utf8);
        sexMenu();
        var sex = stdin.readLineSync(encoding: utf8);

        final Student student = Student(
          code: code!,
          sex: sex!,
          name: name!,
          age: age!,
          city: city!,
        );

        crudController.create(model: student);
        await Future.delayed(const Duration(seconds: 10));
      }

      if (line == 'b') {
        //TODO: Refactor

        print('Borrar registro');
        print('Codigo de estudiante');
        var code = stdin.readLineSync(encoding: utf8);
        if (crudController.delete(code: code!)) {
          print('Se ha eliminado el registro');
        }

        await Future.delayed(const Duration(seconds: 10));
      }

      if (line == 'c') {
        //TODO: Refactor

        print('Actualizar registro');

        print('Digita el codigo: ');
        var code = stdin.readLineSync(encoding: utf8);
        print('Digita el nombre: ');
        var name = stdin.readLineSync(encoding: utf8);
        print('Digita la edad: ');
        var age = stdin.readLineSync(encoding: utf8);
        cityMenu();
        var city = stdin.readLineSync(encoding: utf8);
        sexMenu();
        var sex = stdin.readLineSync(encoding: utf8);

        final Student student = Student(
          code: code!,
          sex: sex!,
          name: name!,
          age: age!,
          city: city!,
        );

        crudController.update(code: code, model: student);

        await Future.delayed(const Duration(seconds: 10));
      }

      if (line == 'd') {
        break;
      }
    }
  }

  void showPrimaryMenu() {
    clear();
    print('''
  *********************************************
  *            Menú Principal                 *
  * Equipo: -- Nombre: Carlos Daniel Peñaloza *
  *********************************************
  * a. Cargar Datos.                          *
  * b. Informe Especial.                      *
  * c. Operaciones                            *
  * d. Salir                                  *
  *********************************************
  ''');
  }

  void showSecondaryMenu() {
    clear();
    print('''
  *********************************************
  *            Menú Secundario                *
  * Equipo: -- Nombre: Carlos Daniel Peñaloza *
  *********************************************
  * a. Crear registro                         *
  * b. Borrar registro                        *
  * c. Actualizar registro                    *
  * d. Salir                                  *
  *********************************************
  ''');
  }

  void sexMenu() {
    clear();
    print('''
  *********************************************
  *            Menú sexo                      *
  * Equipo: -- Nombre: Carlos Daniel Peñaloza *
  *********************************************
  * F. Femenino                               *
  * M. Masculino                              *
  * c. Salir                                  *
  *********************************************
  ''');
  }

  void cityMenu() {
    clear();
    print('''
  *********************************************
  *            Menú sexo                      *
  * Equipo: -- Nombre: Carlos Daniel Peñaloza *
  *********************************************
  * 1. Bucaramanga                            *
  * 2. Girón                                  *
  * 3. Florida                                *
  * 4. Piedecuesta                            *
  * e. Salir                                  *
  *********************************************
  ''');
  }

  void clear() {
    if (Platform.isWindows) {
      print(Process.runSync("cls", [], runInShell: true).stdout);
    } else {
      print(Process.runSync("clear", [], runInShell: true).stdout);
    }
  }
}
