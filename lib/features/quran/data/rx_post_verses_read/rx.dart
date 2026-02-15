import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../common_widgets/custom_toast.dart';
import '../../../../../networks/rx_base.dart';
import 'api.dart';

final class PostVersesReadRx extends RxResponseInt {
  final api = PostVersesReadApi.instance;

  String message = "Something went wrong";

  PostVersesReadRx({required super.empty, required super.dataFetcher});

  ValueStream get fileData => dataFetcher.stream;

  Future<bool> postVersesToggleRead({
    required int verseId,
  }) async {
    try {
      Map resdata = await api.postVersesToggleRead(verseId);
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
