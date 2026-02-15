import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class GetJournalListApi {
  static final GetJournalListApi _singleton = GetJournalListApi._internal();
  GetJournalListApi._internal();
  static GetJournalListApi get instance => _singleton;

  Future<Map> getJournalList() async {
    try {
      Response response = await getHttp(Endpoints.journalEntries());
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
