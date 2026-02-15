import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../../../networks/dio/dio.dart';
import '../../../../../../../networks/endpoints.dart';
import '../../../../../../../networks/exception_handler/data_source.dart';

final class PostForgetPasswordApi {
  static final PostForgetPasswordApi _singleton =
      PostForgetPasswordApi._internal();
  PostForgetPasswordApi._internal();
  static PostForgetPasswordApi get instance => _singleton;

  Future<Map> postForgetPassword(Map data) async {
    try {
      Response response = await postHttp(Endpoints.forgetPassword(), data);
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
