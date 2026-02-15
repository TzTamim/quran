import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class GetJournalTypeApi {
  static final GetJournalTypeApi _singleton = GetJournalTypeApi._internal();
  GetJournalTypeApi._internal();
  static GetJournalTypeApi get instance => _singleton;

  Future<Map> getJournalType() async {
    try {
      Response response = await getHttp(Endpoints.journalTypes());
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
