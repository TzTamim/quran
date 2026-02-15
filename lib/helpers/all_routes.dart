// ignore_for_file: unused_element

import 'dart:io';
import 'package:flutter/cupertino.dart';
import '../features/activities/presentation/auth/presentation/forget_password_screen.dart';
import '../features/activities/presentation/auth/presentation/otp_validation_screen.dart';
import '../features/activities/presentation/auth/presentation/reset_password_screen.dart';
import '../features/activities/presentation/auth/presentation/sign_in_screen.dart';
import '../features/activities/presentation/auth/presentation/sign_up_screen.dart';
import '../features/activities/presentation/auth/presentation/widget/reset_password_successful_screen.dart';
import '../features/home/home_screen.dart';
import '../features/journal/presentation/journal_screen.dart';
import '../features/overcome/presetation/overcome_screen.dart';
import '../features/quran/presentation/surah_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import '../navigation_screen.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  // Auth Routes
  static const String signInScreen = '/logIn';
  static const String signUpScreen = '/signUp';
  static const String homeScreen = '/home';
  static const String navigationScreen = '/navigation';
  static const String forgetPasswordScreen = '/forgetPassword';
  static const String otpScreen = '/otp';
  static const String resetPasswordScreen = '/resetPassword';
  static const String passwordResetSuccessScreen = '/passwordResetSuccess';
  static const String journalScreen = '/journal';
  static const String overcomeScreen = '/overcome';
  static const String surahScreen = '/surah';
  static const String settingsScreen = '/settings';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.surahScreen:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        return Platform.isIOS
            ? CupertinoPageRoute(
                builder: (context) => SurahScreen(
                      surahNumber: args['surahNumber'],
                    ))
            : _FadedTransitionRoute(
                widget: SurahScreen(
                  surahNumber: args['surahNumber'],
                ),
                settings: settings);
      case Routes.signInScreen:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (context) => const SignInScreen())
            : _FadedTransitionRoute(
                widget: const SignInScreen(), settings: settings);
      case Routes.overcomeScreen:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (context) => const OvercomeScreen())
            : _FadedTransitionRoute(
                widget: const OvercomeScreen(), settings: settings);
      case Routes.settingsScreen:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (context) => const SettingsScreen())
            : _FadedTransitionRoute(
                widget: const SettingsScreen(), settings: settings);
      case Routes.journalScreen:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (context) => const JournalScreen())
            : _FadedTransitionRoute(
                widget: const JournalScreen(), settings: settings);
      case Routes.signUpScreen:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (context) => const SignUpScreen())
            : _FadedTransitionRoute(
                widget: const SignUpScreen(), settings: settings);
      case Routes.homeScreen:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (context) => const HomeScreen())
            : _FadedTransitionRoute(
                widget: const HomeScreen(), settings: settings);
      case Routes.navigationScreen:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (context) => const NavigationScreen())
            : _FadedTransitionRoute(
                widget: const NavigationScreen(), settings: settings);
      case Routes.forgetPasswordScreen:
        return Platform.isIOS
            ? CupertinoPageRoute(
                builder: (context) => const ForgetPasswordScreen())
            : _FadedTransitionRoute(
                widget: const ForgetPasswordScreen(), settings: settings);
      case Routes.otpScreen:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        return Platform.isIOS
            ? CupertinoPageRoute(
                builder: (context) => OtpValidationScreen(
                      email: args['email'],
                    ))
            : _FadedTransitionRoute(
                widget: OtpValidationScreen(
                  email: args['email'],
                ),
                settings: settings);
      case Routes.resetPasswordScreen:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        return Platform.isIOS
            ? CupertinoPageRoute(
                builder: (context) => ResetPasswordScreen(
                      email: args['email'],
                    ))
            : _FadedTransitionRoute(
                widget: ResetPasswordScreen(
                  email: args['email'],
                ),
                settings: settings);
      case Routes.passwordResetSuccessScreen:
        return Platform.isIOS
            ? CupertinoPageRoute(
                builder: (context) => const ResetPasswordSuccessfulScreen())
            : _FadedTransitionRoute(
                widget: const ResetPasswordSuccessfulScreen(),
                settings: settings);
      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}
