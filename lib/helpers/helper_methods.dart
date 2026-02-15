// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
// import 'package:http/http.dart' as http;
import '/helpers/di.dart';
import '../constants/app_constants.dart';

final ImagePicker _picker = ImagePicker();
//final appData = locator.get<GetStorage>();
// final plcaeMarkAddress = locator.get<PlcaeMarkAddress>();
//declared for cart scrren calling bottom shit with this from reorder rx
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<PopupMenuButtonState<String>> popUpGlobalkey =
    GlobalKey<PopupMenuButtonState<String>>();

// Future<String?> networkImageToBase64(String imageUrl) async {
//   http.Response response = await http.get(Uri.parse(imageUrl));
//   final bytes = response.bodyBytes;

//   // ignore: unnecessary_null_comparison
//   return (bytes != null ? base64Encode(bytes) : null);
// }

Future<void> setInitValue() async {
  appData.writeIfNull(kKeyfirstTime, true);
  await appData.writeIfNull(kKeyIsLoggedIn, false);
  await appData.writeIfNull(kKeyIsExploring, false);

  // appData.writeIfNull(kKeySelectedLat, 38.74631383626653);
  // appData.writeIfNull(kKeySelectedLng, -9.130169921874991);
//codemen

  // var deviceInfo = DeviceInfoPlugin();
  // if (Platform.isIOS) {
  //   var iosDeviceInfo = await deviceInfo.iosInfo;
  //   appData.writeIfNull(
  //       kKeyDeviceID, iosDeviceInfo.identifierForVendor); // unique ID on iOS
  // } else if (Platform.isAndroid) {
  //   var androidDeviceInfo =
  //       await deviceInfo.androidInfo; // unique ID on Android
  //   appData.writeIfNull(kKeyDeviceID, androidDeviceInfo.id);
  // }
  await Future.delayed(const Duration(seconds: 2));
}

// Future<void> initiInternetChecker() async {
//   InternetConnectionChecker.createInstance(
//           checkTimeout: const Duration(seconds: 1),
//           checkInterval: const Duration(seconds: 2))
//       .onStatusChange
//       .listen((status) {
//     switch (status) {
//       case InternetConnectionStatus.connected:
//         ToastUtil.showShortToast('Data connection is available.');
//         break;
//       case InternetConnectionStatus.disconnected:
//         ToastUtil.showNoInternetToast();
//         break;
//     }
//   });
// }

Future<File> getLocalFile(String filename) async {
  File f = File(filename);
  return f;
}

// void showMaterialDialog(
//   BuildContext context,
// ) {
//   showDialog<bool>(
//       context: context,
//       builder: (context) => AlertDialog(
//             title: const Text(
//               "Do you want to exit the app?",
//               textAlign: TextAlign.center,
//               style: TextStyle(),
//             ),
//             actions: <Widget>[
//               customeButton(
//                   name: "No".tr,
//                   onCallBack: () {
//                     Navigator.of(context).pop(false);
//                   },
//                   height: 30.sp,
//                   minWidth: .3.sw,
//                   borderRadius: 30.r,
//                   color: const Color(0xffFAEDEC),
//                   textStyle: TextStyle(
//                     fontSize: 17.sp,
//                     color: AppColors.c0A957B,
//                     fontWeight: FontWeight.w700,
//                   ),
//                   context: context),
//               customeButton(
//                   name: "Yes".tr,
//                   onCallBack: () {
//                     if (Platform.isAndroid) {
//                       SystemNavigator.pop();
//                     } else if (Platform.isIOS) {
//                       exit(0);
//                     }
//                   },
//                   height: 30.sp,
//                   minWidth: .3.sw,
//                   borderRadius: 30.r,
//                   color: AppColors.c0A957B,
//                   textStyle: TextStyle(
//                       fontSize: 17.sp,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w700),
//                   context: context),
//             ],
//           ));
// }

void rotation() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromARGB(80, 0, 0, 0),
    statusBarIconBrightness: Brightness.light,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

Future<XFile?> pickImage() async {
  try {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image;
    }
    return null;
  } catch (e) {
    return null;
  }
}

String getMonthName(int monthNumber) {
  const List<String> monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  if (monthNumber < 1 || monthNumber > 12) {
    return 'Invalid month';
  }

  return monthNames[monthNumber - 1];
}

Future<void> deleteAccountConfirmation({
  required BuildContext context,
  required Function onConfirm,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete Account'),
        content: const Text('Are you sure you want to delete your account?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm();
            },
          ),
        ],
      );
    },
  );
}

Color hexToColor(String? hexColor) {
  if (hexColor == null) return Colors.transparent;

  try {
    hexColor = hexColor.replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }

    final intColor = int.tryParse(hexColor, radix: 16);
    if (intColor == null) return Colors.transparent;

    return Color(intColor);
  } catch (_) {
    return Colors.transparent;
  }
}

String formatDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  return DateFormat('MMMM d, yyyy').format(dateTime);
}

Duration parseDurationFromString(String time) {
  final parts = time.split(':');

  if (parts.length != 3) {
    throw const FormatException("Invalid duration format. Expected HH:MM:SS");
  }

  final hours = int.parse(parts[0]);
  final minutes = int.parse(parts[1]);
  final seconds = int.parse(parts[2]);

  return Duration(
    hours: hours,
    minutes: minutes,
    seconds: seconds,
  );
}
