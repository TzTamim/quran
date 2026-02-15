import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class GetStrategiesListApi {
  static final GetStrategiesListApi _singleton =
      GetStrategiesListApi._internal();
  GetStrategiesListApi._internal();
  static GetStrategiesListApi get instance => _singleton;

  Future<List<dynamic>> getStrategiesList() async {
    try {
      Response response = await getHttp(Endpoints.strategies());
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
