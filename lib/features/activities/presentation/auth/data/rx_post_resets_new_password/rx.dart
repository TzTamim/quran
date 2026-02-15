import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../../common_widgets/custom_toast.dart';
import '../../../../../../../networks/rx_base.dart';
import 'api.dart';

final class PostResetsNewPasswordRx extends RxResponseInt {
  final api = PostResetsNewPasswordApi.instance;

  String message = "Something went wrong";

  PostResetsNewPasswordRx({required super.empty, required super.dataFetcher});

  ValueStream get fileData => dataFetcher.stream;

  Future<bool> postResetsNewPassword({
    required String email,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
        "new_password": newPassword,
        "confirm_new_password": confirmNewPassword,
      };

      Map resdata = await api.postResetsNewPassword(data);
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
