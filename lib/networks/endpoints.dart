// ignore_for_file: constant_identifier_names
const String url = "https://imanflow.softvencealpha.com/api/v1/";
const String baseUrl = "https://imanflow.softvencealpha.com";

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

final class Endpoints {
  Endpoints._();
  //backend_url
  static String signUp() => "/account/signup/";
  static String logIn() => "/account/signin/";
  static String forgetPassword() => "/account/forgot-password/request/";

  ///profile

  // static String getShopByCategories(String slug) =>
  //     "/api/shop-categories/$slug/";

  static String otpVerify() => "/account/otp/verify/";
  static String resetPassword() => "/account/reset-password/";
  static String deleteAccount() => "/account/delete/";
  static String logOut() => "/account/logout/";
  static String profile() => "/account/profile/";
  static String surahList(String query) => "quransharif/surahs/?q=$query";
  static String surahDetails(int id) => "/quransharif/surahs/$id/";
  static String verseRead(int varseId) =>
      "/quransharif/verses/$varseId/toggle-read/";
  static String overallProgress() => "/quransharif/overall-progress/";
  static String activitesList(String? query) =>
      query != null ? "/activities/list/?search=$query" : "/activities/list/";
  static String todaysGoals() => "/activities/today-goals/";
  static String resetSurahProgress(int surahNumber) =>
      "/quransharif/surahs/$surahNumber/reset-progress/";
  static String activitiesComplete(int taskId) =>
      "/activities/task/$taskId/complete/";
  static String activitiesDetail(int taskId) => "/activities/detail/$taskId/";
  static String journalMoods() => "/journal/moods/";
  static String journalTypes() => "/journal/types/";
  static String journalEntriesFavorite(int entryId) =>
      "/journal/entries/$entryId/favorite/";
  static String journalEntriesDelete(int entryId) =>
      "/journal/entries/$entryId/delete/";
  static String journalEntriesUpdate(int entryId) =>
      "/journal/entries/$entryId/update/";
  static String journalEntries() => "/journal/entries/";
  static String homeActivities() => "/activities/home-activities/";
  static String recoveryStart() => "/recovery/start/";
  static String triggers() => "/recovery/triggers/";
  static String strategies() => "/recovery/coping-strategies/";
}
