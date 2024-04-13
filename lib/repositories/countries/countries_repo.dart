import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
part 'countries_modal.dart';


class CountriesRepository {
  final Dio _dio = Dio();

  Future<List<CountriesModal>> countriesDataFetch() async {
    try {
      final response = await _dio.get(
        "https://api.rootnet.in/covid19-in/stats/latest",
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        if (kDebugMode) {
          print(data);
        }

        final casesDataList = data['data']['regional'] as List<dynamic>;
        List<CountriesModal> countries = [];

        for (var caseData in casesDataList) {
          countries.add(CountriesModal.fromMap(caseData));
        }

        return countries;
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