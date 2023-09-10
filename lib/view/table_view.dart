import 'package:taller_inicial/model/model.dart';
import 'package:taller_inicial/utils/utils.dart';

abstract class PaintRow<T> {
  String paintRow(T model);
}

abstract class PaintHeader {
  String paintHeader();
}

class StudentTableView implements PaintRow<Student>, PaintHeader {
  @override
  String paintRow(Student model) =>
      '| ${model.code.padRight(8)} | ${model.name.padRight(36)} | ${mapSex[model.sex]!.padRight(10)} | ${model.age.padRight(5)} | ${mapCities[model.city]!.padRight(20)} |';

  @override
  String paintHeader() =>
      '\n| ${'Code'.padding(2)} | ${'Name'.padding(16)} | ${'Sex'.padding(3)}  |  Age  | ${'City'.padding(8)} |\n';
}

class CityReportTableView implements PaintRow<CityReport>, PaintHeader {
  @override
  String paintHeader() => '\n| ${'City'.padding(12)} | ${'%'.padRight(25)} |\n';

  @override
  String paintRow(CityReport model) => '''
| ${'Bucaramanga'.padding(9)}| ${model.reportBucaramanga.toString().padRight(25)} |
| ${'Girón      '.padding(9)}| ${model.reportGiron.toString().padRight(25)} |
| ${'Florida    '.padding(9)}| ${model.reportFlorida.toString().padRight(25)} |
| ${'Piedecuesta'.padding(9)}| ${model.reportPiedecuesta.toString().padRight(25)} |
''';
}

class GenreReportTableView implements PaintRow<GenreReport>, PaintHeader {
  @override
  String paintHeader() => '\n| ${'Genre'.padding(12)}| ${'%'.padRight(25)} |\n';

  @override
  String paintRow(GenreReport model) => '''
| ${'Femenino '.padding(10)}| ${model.reportFemenino.toString().padRight(25)} |
| ${'Masculino'.padding(10)}| ${model.reportMasculino.toString().padRight(25)} |
''';
}

class GroupReportTableView implements PaintRow<GroupReport>, PaintHeader {
  @override
  String paintHeader() => '\n| ${'Group'.padding(12)}| ${'%'.padRight(25)} |\n';

  @override
  String paintRow(GroupReport model) => '''
| ${'Group 1  '.padding(10)}| ${model.reportGroup_1.toString().padRight(25)} |
| ${'Group 2  '.padding(10)}| ${model.reportGroup_2.toString().padRight(25)} |
| ${'Group 3  '.padding(10)}| ${model.reportGroup_3.toString().padRight(25)} |
''';
}
