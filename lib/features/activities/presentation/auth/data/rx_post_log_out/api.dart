import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../../../networks/dio/dio.dart';
import '../../../../../../../networks/endpoints.dart';
import '../../../../../../../networks/exception_handler/data_source.dart';

final class PostLogOutApi {
  static final PostLogOutApi _singleton = PostLogOutApi._internal();
  PostLogOutApi._internal();
  static PostLogOutApi get instance => _singleton;

  Future<Map> postLogOut(Map data) async {
    try {
      Response response = await postHttp(Endpoints.logOut(), data);
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
