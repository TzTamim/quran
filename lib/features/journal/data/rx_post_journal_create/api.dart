import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class PostJournalCreateApi {
  static final PostJournalCreateApi _singleton =
      PostJournalCreateApi._internal();
  PostJournalCreateApi._internal();
  static PostJournalCreateApi get instance => _singleton;

  Future<Map> postJournalSaveEntry(Map data) async {
    try {
      Response response = await postHttp(Endpoints.journalEntries(), data);
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
