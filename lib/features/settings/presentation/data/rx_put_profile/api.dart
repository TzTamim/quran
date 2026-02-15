import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class PutProfileUpdateApi {
  static final PutProfileUpdateApi _singleton = PutProfileUpdateApi._internal();
  PutProfileUpdateApi._internal();
  static PutProfileUpdateApi get instance => _singleton;

  Future<Map> putProfileUpdate(Map data) async {
    try {
      Response response = await putHttp(Endpoints.profile(), data);
      if (response.statusCode == 200) {
        Map data = json.decode(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
