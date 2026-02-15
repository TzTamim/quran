import '../features/activities/data/rx_get_activities_list/rx.dart';
import '../features/activities/presentation/auth/data/rx_post_forget_password/rx.dart';
import '../features/home/data/rx_get_home_activities/rx.dart';
import '../features/journal/data/rx_delete_journal/rx.dart';
import '../features/journal/data/rx_get_journal_list/rx.dart';
import '../features/journal/data/rx_get_mood_list/rx.dart';
import '../features/journal/data/rx_post_journal_create/rx.dart';
import '../features/overcome/data/rx_get_strategies/rx.dart';
import '../features/overcome/data/rx_get_triggers/rx.dart';
import '../features/overcome/data/rx_post_begin_journey/rx.dart';
import '../features/profile/data/rx_delete_account/rx.dart';
import '../features/quran/data/rx_get_overall_progress/rx.dart';
import '../features/quran/data/rx_get_surah_list/rx.dart';
import '../features/quran/data/rx_post_verses_read/rx.dart';
import '../features/settings/presentation/data/rx_get_profile/rx.dart';
import '../features/settings/presentation/data/rx_put_profile/rx.dart';
import 'package:rxdart/rxdart.dart';
import '../features/activities/presentation/auth/data/rx_post_login/rx.dart';
import '../features/activities/presentation/auth/data/rx_post_signup/rx.dart';

import '../features/activities/data/rx_get_activities_details/rx.dart';
import '../features/activities/data/rx_get_todays_goals/rx.dart';
import '../features/activities/data/rx_post_activities_completed/rx.dart';
import '../features/activities/presentation/auth/data/rx_post_log_out/rx.dart';
import '../features/activities/presentation/auth/data/rx_post_otp_verify/rx.dart';
import '../features/activities/presentation/auth/data/rx_post_resets_new_password/rx.dart';

import '../features/journal/data/rx_get_type/rx.dart';
import '../features/quran/data/rx_get_surah_details/rx.dart';
import '../features/quran/data/rx_post_reset_surah_progress/rx.dart';

PostLoginRx postLoginRxObj =
    PostLoginRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostSignupRx postSignupRxObj =
    PostSignupRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

PostForgetPasswordRx postForgetPasswordRxObj =
    PostForgetPasswordRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostOtpVerifyRx postOtpVerifyRxObj =
    PostOtpVerifyRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostResetsNewPasswordRx postResetsNewPasswordRxObj =
    PostResetsNewPasswordRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
DeleteAccountRx deleteAccountRxObj =
    DeleteAccountRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostLogOutRx postLogOutRxObj =
    PostLogOutRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetProfileRx getProfileRxObj =
    GetProfileRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PutProfileRx putProfileRxObj =
    PutProfileRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

GetSurahListRx getSurahListRxObj =
    GetSurahListRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetSurahDetailsRx getSurahDetailsRxObj =
    GetSurahDetailsRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostVersesReadRx postVersesReadRxObj =
    PostVersesReadRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetOverallProgressRx getOverallProgressRxObj =
    GetOverallProgressRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetActivitiesListRx getActivitiesListRxObj =
    GetActivitiesListRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetTodaysGoalsRx getTodaysGoalsRxObj =
    GetTodaysGoalsRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostResetSurahProgressRx postResetSurahProgressRxObj =
    PostResetSurahProgressRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostActivitiesCompletedRx postActivitiesCompletedRxObj =
    PostActivitiesCompletedRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

GetActivitiesDetailsRx getActivitiesDetailsRxObj =
    GetActivitiesDetailsRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetMoodListRx getMoodListRxObj =
    GetMoodListRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetJournalTypeRx getJournalTypeRxObj =
    GetJournalTypeRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostJournalSaveEntryRx postJournalSaveEntryRxObj =
    PostJournalSaveEntryRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetJournalListRx getJournalListRxObj =
    GetJournalListRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
DeleteJournalEntryRx deleteJournalEntryRxObj =
    DeleteJournalEntryRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetHomeActivitiesRx getHomeActivitiesRxObj =
    GetHomeActivitiesRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostBeginJourneyRx postBeginJourneyRxObj =
    PostBeginJourneyRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetTriggersListRx getTriggersListRxObj =
    GetTriggersListRx(empty: {}, dataFetcher: BehaviorSubject<List<dynamic>>());
GetStrategiesListRx getStrategiesListRxObj = GetStrategiesListRx(
    empty: {}, dataFetcher: BehaviorSubject<List<dynamic>>());
