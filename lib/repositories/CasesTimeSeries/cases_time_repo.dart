import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
part 'cases_time_series.dart';
class CasesTimeSeriesRepository {
  final Dio _dio = Dio();

  Future<SummaryModal> fetchCasesTimeSeries() async {
    try {
      final response = await _dio.get(
        "https://api.rootnet.in/covid19-in/stats/latest",
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        if (kDebugMode) {
          print(data);
        }

        final casesData = data['data']['summary'] as Map<String, dynamic>; // Access summary data
        if (casesData.isNotEmpty) {
          return SummaryModal.fromMap(casesData);
        } else {
          throw Exception('No data available');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      throw Exception('Error while fetching data: $e');
    }
  }
}
