part of 'cases_time_repo.dart';

class CasesTimeSeriesModal {
  String dailyconfirmed;
  String dailydeceased;
  String dailyrecovered;
  String date;
  DateTime dateymd;
  String totalconfirmed;
  String totaldeceased;
  String totalrecovered;

  CasesTimeSeriesModal({
    required this.dailyconfirmed,
    required this.dailydeceased,
    required this.dailyrecovered,
    required this.date,
    required this.dateymd,
    required this.totalconfirmed,
    required this.totaldeceased,
    required this.totalrecovered,
  });

  factory CasesTimeSeriesModal.fromMap(Map<String, dynamic> map) {
    return CasesTimeSeriesModal(
      dailyconfirmed: map['dailyconfirmed'],
      dailydeceased: map['dailydeceased'],
      dailyrecovered: map['dailyrecovered'],
      date: map['date'],
      dateymd: DateTime.parse(map['dateymd']),
      totalconfirmed: map['totalconfirmed'],
      totaldeceased: map['totaldeceased'],
      totalrecovered: map['totalrecovered'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dailyconfirmed': dailyconfirmed,
      'dailydeceased': dailydeceased,
      'dailyrecovered': dailyrecovered,
      'date': date,
      'dateymd': dateymd.toIso8601String(),
      'totalconfirmed': totalconfirmed,
      'totaldeceased': totaldeceased,
      'totalrecovered': totalrecovered,
    };
  }
}
