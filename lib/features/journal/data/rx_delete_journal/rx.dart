import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../../../common_widgets/custom_toast.dart';
import '../../../../../networks/rx_base.dart';
import 'api.dart';

final class DeleteJournalEntryRx extends RxResponseInt {
  final api = DeleteJournalApi.instance;

  DeleteJournalEntryRx({required super.empty, required super.dataFetcher});

  Future<bool> deleteJournalEntry(int id) async {
    try {
      Map resdata = await api.deleteJournalEntry(id);
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
