import 'package:dio/dio.dart';
import 'package:f1_mobile_app/models/models.dart';
import 'package:f1_mobile_app/services/services.dart';

class OpenF1Api {
  OpenF1Api();
  late final Dio _dio = AppDio().initial();
  static const String baseUrl = 'https://api.openf1.com';

  Future<List<T>> _fetchData<T>({
    required Uri uri,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    print(uri);
    final response = await _dio.get(uri.toString());
    if (response.statusCode == 200) {
      //print(response.data);
      final body = response.data as List;
      return body
          .map((dynamic item) => fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: response.statusMessage,
      );
    }
  }

  Future<String> getSession(String sessionId) async {
    final response = await _dio.get('$baseUrl/sessions/$sessionId');
    return response.data.toString();
  }

  Future<List<Meeting>> getMeetings({
    int? year,
    String? circuitKeyName,
    String? circuitShortName,
    String? countryCode,
    int? countryKey,
    String? countryName,
    String? dateStart,
    String? gmtOffset,
    String? location,
    int? meetingKey,
    String? meetingName,
    String? meetingOfficialName,
  }) async {
    final queryParams = <String, dynamic>{
      if (year != null) 'year': year.toString(),
      if (circuitKeyName != null) 'circuit_key': circuitKeyName,
      if (circuitShortName != null) 'circuit_short_name': circuitShortName,
      if (countryCode != null) 'country_code': countryCode,
      if (countryKey != null) 'country_key': countryKey.toString(),
      if (countryName != null) 'country_name': countryName,
      if (dateStart != null) 'date_start': dateStart,
      if (gmtOffset != null) 'gmt_offset': gmtOffset,
      if (location != null) 'location': location,
      if (meetingKey != null) 'meeting_key': meetingKey.toString(),
      if (meetingName != null) 'meeting_name': meetingName,
      if (meetingOfficialName != null)
        'meeting_official_name': meetingOfficialName,
    };
    Uri uri =
        Uri.parse('$baseUrl/meetings').replace(queryParameters: queryParams);
    return _fetchData<Meeting>(uri: uri, fromJson: Meeting.fromJson);
  }
}
