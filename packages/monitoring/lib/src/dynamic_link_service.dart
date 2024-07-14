import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'dynamic_link_service_impl.dart';

export 'package:firebase_dynamic_links/firebase_dynamic_links.dart'
    show SocialMetaTagParameters;

typedef OnNewDynamicLinkPath = void Function(String newDynamicLinkPath);

/// Wrapper around [FirebaseDynamicLinks].
abstract class DynamicLinkService {
  Future<String> generateDynamicLinkUrl({
    required String path,
    SocialMetaTagParameters? socialMetaTagParameters,
  });

  Future<String?> getInitialDynamicLinkPath();

  Stream<String> onNewDynamicLinkPath();

  static DynamicLinkService getService(bool isWeb) =>
      (isWeb) ? DynamicLinkServiceForWeb() : DynamicLinkServiceImpl();
}
