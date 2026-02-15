import 'dart:developer';
import 'package:dio/dio.dart';

import '../../../../../common_widgets/custom_toast.dart';
import '../../../../../networks/rx_base.dart';
import 'api.dart';

final class PutProfileRx extends RxResponseInt {
  final api = PutProfileUpdateApi.instance;

  PutProfileRx({required super.empty, required super.dataFetcher});

  Future<bool> putProfileUpdate({
    String? name,
    String? profilePath,
  }) async {
    try {
      Map<String, dynamic> data = {};

      if (name != null && name.isNotEmpty) {
        data["full_name"] = name.trim();
      }

      if (profilePath != null && profilePath.isNotEmpty) {
        data["avatar"] = await MultipartFile.fromFile(profilePath);
      }

      if (data.isEmpty) {
        customToastMessage('Info', 'Nothing to update');
        return false;
      }
      Map resdata = await api.putProfileUpdate(data);
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
