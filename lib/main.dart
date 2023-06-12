import 'package:ai_writing/helper/analytics_helper.dart';
import 'package:ai_writing/helper/crash_helper.dart';
import 'package:ai_writing/helper/subscription_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'utils/config_packages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();
  SubScriptionHandler.init();
  AnalyticsHelper.initAnalytics();
  CrashHelper.initCrashlytics();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  AdHelper.listenToAppStateChanges();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppString.appname,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: StorageHelper().getTheme == null
            ? ThemeMode.system
            : (StorageHelper().getTheme ?? Get.isDarkMode)
                ? ThemeMode.dark
                : ThemeMode.light,
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: child!);
        },
        home: const SplashScreen(),
      ),
    );
  }
}
