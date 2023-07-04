import 'package:ai_writing/utils/config_packages.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsHelper {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  static initAnalytics() {
    analytics.setAnalyticsCollectionEnabled(true);
    if (StorageHelper().isNewUser) {
      analytics.logEvent(name: 'Install Users');
    }
  }
}
