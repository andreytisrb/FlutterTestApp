
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:monitoring/monitoring.dart';
import 'package:flutter/foundation.dart';

class AnalyticsServiceImpl implements AnalyticsService {
  AnalyticsServiceImpl({
    @visibleForTesting FirebaseAnalytics? analytics,
  }) : _analytics = analytics ?? FirebaseAnalytics.instance;

  final FirebaseAnalytics _analytics;

  Future<void> setCurrentScreen(String screenName) {
    return _analytics.logScreenView(
      screenName: screenName,
    );
  }

  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) {
    return _analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }
}

class AnalyticsServiceMock implements AnalyticsService{
  @override
  logEvent({required String name, Map<String, Object>? parameters}) async {}
  @override
  Future<void> setCurrentScreen(String screenName)  async {}
}