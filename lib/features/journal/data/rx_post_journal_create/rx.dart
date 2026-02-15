import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../common_widgets/custom_toast.dart';
import '../../../../../networks/rx_base.dart';
import 'api.dart';

final class PostJournalSaveEntryRx extends RxResponseInt {
  final api = PostJournalCreateApi.instance;

  String message = "Something went wrong";

  PostJournalSaveEntryRx({required super.empty, required super.dataFetcher});

  ValueStream get fileData => dataFetcher.stream;

  Future<bool> postJournalSaveEntry({
    required String title,
    required String trhoughts,
    required int moodId,
    required int entryTypeId,
  }) async {
    try {
      Map<String, dynamic> data = {
        "title": title,
        "content": trhoughts,
        "mood": moodId,
        "entry_type": entryTypeId
      };

      Map resdata = await api.postJournalSaveEntry(data);
      return await handleSuccessWithReturn(resdata);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    dataFetcher.sink.add(data);
    return true;
  }

  @override
  handleErrorWithReturn(error) {
    String message = 'Something went wrong';
    log(error.toString());
    if (error is DioException) {
      message =
          error.response?.data["message"].toString() ?? "Something went wrong";
      if (error.type == DioExceptionType.connectionError) {
        message = "Check Your Network Connection";
      }
    }
    customToastMessage('Error', message);
    return false;
  }
}
