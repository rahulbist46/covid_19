import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
part 'unofficial-summary_Modal.dart';
class UnofficialSummaryRepo {
  final Dio _dio = Dio();

  Future<UnofficialSummaryModal> fetchUnofficialSummeryModal() async {
    try {
      final response = await _dio.get(
          "https://api.rootnet.in/covid19-in/stats/latest");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        if (kDebugMode) {
          print(data);
        }

        final List<
            dynamic> caseDataList = data['data']['unofficial-summary'] as List<
            dynamic>;

        if (caseDataList.isNotEmpty) {
          // Assuming you only need the first element from the list
          final Map<String, dynamic> caseData = caseDataList[0] as Map<
              String,
              dynamic>;
          return UnofficialSummaryModal.fromMap(caseData);
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