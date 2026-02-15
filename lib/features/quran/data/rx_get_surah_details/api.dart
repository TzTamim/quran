import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class GetSurahDetailsApi {
  static final GetSurahDetailsApi _singleton = GetSurahDetailsApi._internal();
  GetSurahDetailsApi._internal();
  static GetSurahDetailsApi get instance => _singleton;

  Future<Map> getSurahDetails(int id) async {
    try {
      Response response = await getHttp(Endpoints.surahDetails(id));
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
