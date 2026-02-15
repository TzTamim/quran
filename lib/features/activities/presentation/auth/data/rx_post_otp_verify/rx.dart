import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../../common_widgets/custom_toast.dart';
import '../../../../../../../networks/rx_base.dart';
import 'api.dart';

final class PostOtpVerifyRx extends RxResponseInt {
  final api = PostOtpVerifyApi.instance;

  String message = "Something went wrong";

  PostOtpVerifyRx({required super.empty, required super.dataFetcher});

  ValueStream get fileData => dataFetcher.stream;

  Future<bool> postOtpVerify({
    required String email,
    required String code,
  }) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
        "code": code,
      };

      Map resdata = await api.postOtpVerify(data);
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
