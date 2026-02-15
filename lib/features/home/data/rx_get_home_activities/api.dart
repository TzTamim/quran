import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class GetHomeActivitiesApi {
  static final GetHomeActivitiesApi _singleton =
      GetHomeActivitiesApi._internal();
  GetHomeActivitiesApi._internal();
  static GetHomeActivitiesApi get instance => _singleton;

  Future<Map> getHomeActivities() async {
    try {
      Response response = await getHttp(Endpoints.homeActivities());
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
