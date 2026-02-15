import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../../../networks/dio/dio.dart';
import '../../../../../../../networks/endpoints.dart';
import '../../../../../../../networks/exception_handler/data_source.dart';

final class PostOtpVerifyApi {
  static final PostOtpVerifyApi _singleton = PostOtpVerifyApi._internal();
  PostOtpVerifyApi._internal();
  static PostOtpVerifyApi get instance => _singleton;

  Future<Map> postOtpVerify(Map data) async {
    try {
      Response response = await postHttp(Endpoints.otpVerify(), data);
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
