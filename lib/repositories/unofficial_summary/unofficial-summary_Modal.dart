part of 'unofficial_summary_repo.dart';

class UnofficialSummaryModal {
  String source;
  int total;
  int recovered;
  int deaths;
  int active;

  UnofficialSummaryModal({
    required this.source,
    required this.total,
    required this.recovered,
    required this.deaths,
    required this.active,
  });

  factory UnofficialSummaryModal.fromMap(Map<String, dynamic> map) {
    return UnofficialSummaryModal(
      source: map['source'] ?? '',
      total: map['total'] ?? 0,
      recovered: map['recovered'] ?? 0,
      deaths: map['deaths'] ?? 0,
      active: map['active'] ?? 0,
    );
  }

  UnofficialSummaryModal copyWith({
    String? source,
    int? total,
    int? recovered,
    int? deaths,
    int? active,
  }) =>
      UnofficialSummaryModal(
        source: source ?? this.source,
        total: total ?? this.total,
        recovered: recovered ?? this.recovered,
        deaths: deaths ?? this.deaths,
        active: active ?? this.active,
      );
}
