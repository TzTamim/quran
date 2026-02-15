import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class PostResetSurahProgressApi {
  static final PostResetSurahProgressApi _singleton =
      PostResetSurahProgressApi._internal();
  PostResetSurahProgressApi._internal();
  static PostResetSurahProgressApi get instance => _singleton;

  Future<Map> postresetSurahProgress(int surahNumber) async {
    try {
      Response response =
          await postHttp(Endpoints.resetSurahProgress(surahNumber));
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
