import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class GetTriggersListApi {
  static final GetTriggersListApi _singleton = GetTriggersListApi._internal();
  GetTriggersListApi._internal();
  static GetTriggersListApi get instance => _singleton;

  Future<List<dynamic>> getTriggersList() async {
    try {
      Response response = await getHttp(Endpoints.triggers());
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
