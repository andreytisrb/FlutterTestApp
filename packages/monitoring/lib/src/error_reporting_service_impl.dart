import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:monitoring/src/error_reporting_service.dart';

import '../monitoring.dart';

/// Wrapper around [FirebaseCrashlytics].
class ErrorReportingServiceImpl implements ErrorReportingService {
  ErrorReportingServiceImpl({
    @visibleForTesting FirebaseCrashlytics? crashlytics,
  }) : _crashlytics = crashlytics ?? FirebaseCrashlytics.instance;

  final FirebaseCrashlytics _crashlytics;

  Future<void> recordFlutterError(FlutterErrorDetails flutterErrorDetails) {
    return _crashlytics.recordFlutterError(flutterErrorDetails);
  }

  Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    bool fatal = false,
  }) {
    return _crashlytics.recordError(
      exception,
      stack,
      fatal: fatal,
    );
  }
}

class ErrorReportingServiceMock implements ErrorReportingService {
  @override
  Future<void> recordError(exception, StackTrace? stack,
      {bool fatal = false}) async {
    print(stack);
    print(exception);
  }

  @override
  Future<void> recordFlutterError(FlutterErrorDetails flutterErrorDetails) async {
    print(flutterErrorDetails);
  }
}
