import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../../common_widgets/custom_toast.dart';
import '../../../../../../../networks/rx_base.dart';
import '../../../../../../constants/app_constants.dart';
import '../../../../../../helpers/di.dart';
import 'api.dart';

final class PostLogOutRx extends RxResponseInt {
  final api = PostLogOutApi.instance;

  String message = "Something went wrong";

  PostLogOutRx({required super.empty, required super.dataFetcher});

  ValueStream get fileData => dataFetcher.stream;

  Future<bool> postLogOut({
    required String refreshToken,
  }) async {
    try {
      Map<String, dynamic> data = {
        "refresh": refreshToken,
      };

      Map resdata = await api.postLogOut(data);
      return await handleSuccessWithReturn(resdata);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    appData.write(kKeyIsLoggedIn, false);
    appData.write(kKeyAccessToken, "");
    appData.write(kKeyRefreshToken, "");
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
