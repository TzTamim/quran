import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class GetTodaysGoalsApi {
  static final GetTodaysGoalsApi _singleton = GetTodaysGoalsApi._internal();
  GetTodaysGoalsApi._internal();
  static GetTodaysGoalsApi get instance => _singleton;

  Future<Map> getTodaysGoals() async {
    try {
      Response response = await getHttp(Endpoints.todaysGoals());
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
