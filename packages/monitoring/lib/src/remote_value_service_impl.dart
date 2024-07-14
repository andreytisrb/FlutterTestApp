import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

import '../monitoring.dart';

class RemoteValueServiceImpl implements RemoteValueService {
  static const _gridQuotesViewEnabledKey = 'grid_quotes_view_enabled';

  RemoteValueServiceImpl({
    @visibleForTesting FirebaseRemoteConfig? remoteConfig,
  }) : _remoteConfig = remoteConfig ?? FirebaseRemoteConfig.instance;

  final FirebaseRemoteConfig _remoteConfig;

  Future<void> load() async {
    await _remoteConfig.setDefaults(<String, dynamic>{
      _gridQuotesViewEnabledKey: true,
    });
    await _remoteConfig.fetchAndActivate();
  }

  bool get isGridQuotesViewEnabled => _remoteConfig.getBool(
        _gridQuotesViewEnabledKey,
      );
}

class RemoteValueServiceMock implements RemoteValueService {
  @override
  // TODO: implement isGridQuotesViewEnabled
  bool get isGridQuotesViewEnabled => true;

  @override
  load() async {}
}
