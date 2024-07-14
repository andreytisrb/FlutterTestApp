import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:monitoring/src/remote_value_service_impl.dart';

/// Wrapper around [FirebaseRemoteConfig].
abstract class RemoteValueService {
  Future<void> load();

  bool get isGridQuotesViewEnabled;

  static RemoteValueService getService(bool isWeb) {
    return (isWeb) ? RemoteValueServiceMock() : RemoteValueServiceImpl();
  }
}
