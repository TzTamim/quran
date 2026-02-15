import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class PostActivitiesCompletedApi {
  static final PostActivitiesCompletedApi _singleton =
      PostActivitiesCompletedApi._internal();
  PostActivitiesCompletedApi._internal();
  static PostActivitiesCompletedApi get instance => _singleton;

  Future<Map> postActivitiesCompleted(int taskId) async {
    try {
      Response response = await postHttp(
        Endpoints.activitiesComplete(taskId),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
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
