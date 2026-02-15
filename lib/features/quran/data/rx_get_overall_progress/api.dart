import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class GetOverAllProgressApi {
  static final GetOverAllProgressApi _singleton =
      GetOverAllProgressApi._internal();
  GetOverAllProgressApi._internal();
  static GetOverAllProgressApi get instance => _singleton;

  Future<Map> getOverallProgress() async {
    try {
      Response response = await getHttp(Endpoints.overallProgress());
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
