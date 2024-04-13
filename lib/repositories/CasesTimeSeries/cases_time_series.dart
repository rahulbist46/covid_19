part of 'cases_time_repo.dart';

class SummaryModal {
  int total;
  int confirmedCasesIndian;
  int confirmedCasesForeign;
  int discharged;
  int deaths;
  int confirmedButLocationUnidentified;

  SummaryModal({
    required this.total,
    required this.confirmedCasesIndian,
    required this.confirmedCasesForeign,
    required this.discharged,
    required this.deaths,
    required this.confirmedButLocationUnidentified,
  });

  SummaryModal copyWith({
    int? total,
    int? confirmedCasesIndian,
    int? confirmedCasesForeign,
    int? discharged,
    int? deaths,
    int? confirmedButLocationUnidentified,
  }) =>
      SummaryModal(
        total: total ?? this.total,
        confirmedCasesIndian: confirmedCasesIndian ?? this.confirmedCasesIndian,
        confirmedCasesForeign: confirmedCasesForeign ?? this.confirmedCasesForeign,
        discharged: discharged ?? this.discharged,
        deaths: deaths ?? this.deaths,
        confirmedButLocationUnidentified:
        confirmedButLocationUnidentified ?? this.confirmedButLocationUnidentified,
      );

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'confirmedCasesIndian': confirmedCasesIndian,
      'confirmedCasesForeign': confirmedCasesForeign,
      'discharged': discharged,
      'deaths': deaths,
      'confirmedButLocationUnidentified': confirmedButLocationUnidentified,
    };
  }

  factory SummaryModal.fromMap(Map<String, dynamic> map) {
    return SummaryModal(
      total: map['total'],
      confirmedCasesIndian: map['confirmedCasesIndian'],
      confirmedCasesForeign: map['confirmedCasesForeign'],
      discharged: map['discharged'],
      deaths: map['deaths'],
      confirmedButLocationUnidentified: map['confirmedButLocationUnidentified'],
    );
  }
}
