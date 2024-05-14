part of 'countries_repo.dart';

class CountriesModal {
  String loc;
  int confirmedCasesIndian;
  int confirmedCasesForeign;
  int discharged;
  int deaths;
  int totalConfirmed;

  CountriesModal({
    required this.loc,
    required this.confirmedCasesIndian,
    required this.confirmedCasesForeign,
    required this.discharged,
    required this.deaths,
    required this.totalConfirmed,
  });

  factory CountriesModal.fromMap(Map<String, dynamic> map) {
    return CountriesModal(
      loc: map['loc'] ?? '',
      confirmedCasesIndian: map['confirmedCasesIndian'] ?? 0,
      confirmedCasesForeign: map['confirmedCasesForeign'] ?? 0,
      discharged: map['discharged'] ?? 0,
      deaths: map['deaths'] ?? 0,
      totalConfirmed: map['totalConfirmed'] ?? 0,
    );
  }

  CountriesModal copyWith({
    String? loc,
    int? confirmedCasesIndian,
    int? confirmedCasesForeign,
    int? discharged,
    int? deaths,
    int? totalConfirmed,
  }) =>
      CountriesModal(
        loc: loc ?? this.loc,
        confirmedCasesIndian: confirmedCasesIndian ?? this.confirmedCasesIndian,
        confirmedCasesForeign:
            confirmedCasesForeign ?? this.confirmedCasesForeign,
        discharged: discharged ?? this.discharged,
        deaths: deaths ?? this.deaths,
        totalConfirmed: totalConfirmed ?? this.totalConfirmed,
      );
}
