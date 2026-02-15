import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class GetActivitesListApi {
  static final GetActivitesListApi _singleton = GetActivitesListApi._internal();
  GetActivitesListApi._internal();
  static GetActivitesListApi get instance => _singleton;

  Future<Map> getActivitesList(String? query) async {
    try {
      Response response = await getHttp(Endpoints.activitesList(query));
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
