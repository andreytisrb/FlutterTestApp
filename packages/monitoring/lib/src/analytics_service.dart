import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:monitoring/src/analytic_service_impl.dart';

/// Wrapper around [FirebaseAnalytics].

abstract class AnalyticsService {
  Future<void> setCurrentScreen(String screenName);

  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  });

  static AnalyticsService getAnalyticsService(bool isMobile) {
    return (isMobile) ? AnalyticsServiceImpl() : AnalyticsServiceMock();
  }
}
