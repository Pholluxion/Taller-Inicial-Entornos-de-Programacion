import 'package:taller_inicial/model/model.dart';
import 'package:taller_inicial/utils/utils.dart';

abstract class Info<T, K> {
  K cityReport(List<T> list);
  K genreReport(List<T> list);
  K groupReport(List<T> list);
}

class InfoController implements Info<Student, Report> {
  @override
  CityReport cityReport(List<Student> list) {
    final CityReport cityReport = CityReport();

    final double reportBucaramanga =
        ((list.where((student) => student.city == '1').length.toDouble()) /
                list.length) *
            100.0;

    final double reportGiron =
        ((list.where((student) => student.city == '2').length.toDouble()) /
                list.length) *
            100.0;

    final double reportFlorida =
        ((list.where((student) => student.city == '3').length.toDouble()) /
                list.length) *
            100.0;

    final double reportPiedecuesta =
        ((list.where((student) => student.city == '4').length.toDouble()) /
                list.length) *
            100.0;

    return cityReport.copyWith(
      reportGiron: reportGiron,
      reportFlorida: reportFlorida,
      reportBucaramanga: reportBucaramanga,
      reportPiedecuesta: reportPiedecuesta,
    );
  }

  @override
  GenreReport genreReport(List<Student> list) {
    final GenreReport genreReport = GenreReport();

    final double reportFemenino =
        ((list.where((student) => student.sex == 'F').length.toDouble()) /
                list.length) *
            100.0;

    final double reportMasculino =
        ((list.where((student) => student.sex == 'M').length.toDouble()) /
                list.length) *
            100.0;

    return genreReport.copyWith(
      reportFemenino: reportFemenino,
      reportMasculino: reportMasculino,
    );
  }

  @override
  GroupReport groupReport(List<Student> list) {
    final GroupReport groupReport = GroupReport();

    final double reportGroup_1 =
        ((list.where((student) => student.age.toInt() <= 5).length.toDouble()) /
                list.length) *
            100.0;

    final double reportGroup_2 = ((list
                .where((student) {
                  return student.age.toInt() > 5 && student.age.toInt() <= 10;
                })
                .length
                .toDouble()) /
            list.length) *
        100.0;

    final double reportGroup_3 =
        ((list.where((student) => student.age.toInt() > 10).length.toDouble()) /
                list.length) *
            100.0;

    return groupReport.copyWith(
      reportGroup_1: reportGroup_1,
      reportGroup_2: reportGroup_2,
      reportGroup_3: reportGroup_3,
    );
  }
}
