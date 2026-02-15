import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class GetActivitiesDetailsApi {
  static final GetActivitiesDetailsApi _singleton =
      GetActivitiesDetailsApi._internal();
  GetActivitiesDetailsApi._internal();
  static GetActivitiesDetailsApi get instance => _singleton;

  Future<Map> getActivitiesDetails(int taskId) async {
    try {
      Response response = await getHttp(Endpoints.activitiesDetail(taskId));
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
