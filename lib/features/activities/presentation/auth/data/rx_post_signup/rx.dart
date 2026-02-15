import 'dart:developer';

import 'package:rxdart/rxdart.dart';
import '../../../../../../constants/app_constants.dart';
import '../../../../../../helpers/di.dart';
import '../../../../../../helpers/error_message_handler.dart';

import '../../../../../../helpers/post_login.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../../../networks/rx_base.dart';
import 'api.dart';

final class PostSignupRx extends RxResponseInt {
  final api = PostSignupApi.instance;
  PostSignupRx({required super.empty, required super.dataFetcher});

  ValueStream get getPostSignupRes => dataFetcher.stream;

  Future<bool> postSignup({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> data = {
        "email": email.trim(),
        "password": password.trim()
      };

      Map resdata = await api.postSignup(data);

      return await handleSuccessWithReturn(resdata);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    log("data===> $data");
    String accesstoken = data['data']['tokens']['access'];
    String refreshtoken = data['data']['tokens']['refresh'];
    String id = data['data']["user"]["id"];
    DioSingleton.instance.update(accesstoken);
    await appData.write(kKeyIsLoggedIn, true);
    await appData.write(kKeyIsExploring, false);
    await appData.write(kKeyUserID, id);
    await appData.write(kKeyAccessToken, accesstoken);
    await appData.write(kKeyRefreshToken, refreshtoken);

    dataFetcher.sink.add(data);
    performPostLoginActions();

    return true;
  }

  @override
  handleErrorWithReturn(error) {
    ErrorMessageHandler.showErrorToast(error);
    return false;
  }
}
