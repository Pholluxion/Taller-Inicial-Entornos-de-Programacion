interface class Report {}

class CityReport extends Report {
  final double reportBucaramanga;
  final double reportGiron;
  final double reportFlorida;
  final double reportPiedecuesta;

  CityReport({
    this.reportGiron = 0.0,
    this.reportFlorida = 0.0,
    this.reportBucaramanga = 0.0,
    this.reportPiedecuesta = 0.0,
  });

  CityReport copyWith({
    double? reportBucaramanga,
    double? reportGiron,
    double? reportFlorida,
    double? reportPiedecuesta,
  }) =>
      CityReport(
        reportBucaramanga: reportBucaramanga ?? this.reportBucaramanga,
        reportPiedecuesta: reportPiedecuesta ?? this.reportPiedecuesta,
        reportFlorida: reportFlorida ?? this.reportFlorida,
        reportGiron: reportGiron ?? this.reportGiron,
      );
}

class GenreReport extends Report {
  final double reportFemenino;
  final double reportMasculino;

  GenreReport({
    this.reportFemenino = 0.0,
    this.reportMasculino = 0.0,
  });

  GenreReport copyWith({
    double? reportFemenino,
    double? reportMasculino,
  }) =>
      GenreReport(
        reportFemenino: reportFemenino ?? this.reportFemenino,
        reportMasculino: reportMasculino ?? this.reportMasculino,
      );
}

class GroupReport extends Report {
  final double reportGroup_1; // menores e iguales a 5 años.
  final double reportGroup_2; // mayor a 5 y menor e igual a 10 años.
  final double reportGroup_3; // mayor a 10 años.

  GroupReport({
    this.reportGroup_1 = 0.0,
    this.reportGroup_2 = 0.0,
    this.reportGroup_3 = 0.0,
  });

  GroupReport copyWith({
    double? reportGroup_1,
    double? reportGroup_2,
    double? reportGroup_3,
  }) =>
      GroupReport(
        reportGroup_1: reportGroup_1 ?? this.reportGroup_1,
        reportGroup_2: reportGroup_2 ?? this.reportGroup_2,
        reportGroup_3: reportGroup_3 ?? this.reportGroup_3,
      );
}
