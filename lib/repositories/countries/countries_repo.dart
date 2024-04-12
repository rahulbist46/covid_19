import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
part 'countries_modal.dart';


class CountriesRepository {
  final Dio _dio = Dio();

  Future<CountriesModal> countriesDataFetch() async {
    try {
      final response = await _dio.get(
        "https://api.rootnet.in/covid19-in/stats/latest",
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        if (kDebugMode) {
          print(data);
        }

        final casesData = data['data']['regional'] as Map<String, dynamic>;
        if (casesData.isNotEmpty) {
          return CountriesModal.fromMap(casesData);
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
