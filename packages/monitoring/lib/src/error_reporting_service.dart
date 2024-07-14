import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:monitoring/src/error_reporting_service_impl.dart';

/// Wrapper around [FirebaseCrashlytics].
abstract class ErrorReportingService {
  Future<void> recordFlutterError(FlutterErrorDetails flutterErrorDetails);

  Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    bool fatal = false,
  });

  static ErrorReportingService getErrorReportingService(bool isMobile) {
    return (isMobile)
        ? ErrorReportingServiceImpl()
        : ErrorReportingServiceMock();
  }
}
