import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class PostBeginJourneyApi {
  static final PostBeginJourneyApi _singleton = PostBeginJourneyApi._internal();
  PostBeginJourneyApi._internal();
  static PostBeginJourneyApi get instance => _singleton;

  Future<Map> postBeginJourney(Map data) async {
    try {
      Response response = await postHttp(Endpoints.recoveryStart(), data);
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
