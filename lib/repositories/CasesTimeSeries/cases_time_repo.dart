import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

part 'cases_time_series.dart';

class CasesTimeSeriesRepository {
  final Dio _dio = Dio();

  Future<CasesTimeSeriesModal> fetchCasesTimeSeries() async {
    try {
      final response = await _dio.get("https://api.covid19india.org/data.json");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.data.toString());
        final casesData = data['cases_time_series'] as List<dynamic>;

        final latestData = casesData.isNotEmpty ? casesData.last : null;

        if (latestData != null) {
          return CasesTimeSeriesModal.fromMap(latestData);
        } else {
          throw Exception('No data available');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error while fetching data: $e');
    }
  }
}
