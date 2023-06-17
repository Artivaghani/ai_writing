import 'package:ai_writing/utils/config_packages.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';

String referCode = '';

class DynamicLinkHandler {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  final String dynamicLink = 'https://aiwriting.page.link';

  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      final String deepLink = dynamicLinkData.link.toString(); // Get DEEP LINK
      final String path = dynamicLinkData.link.path; // Get PATH
      if (deepLink.isEmpty) return;
      handleDeepLink(path);
    }).onError((error) {
      print(error.message);
    });
    initUniLinks();
  }

  Future<void> initUniLinks() async {
    try {
      final initialLink = await dynamicLinks.getInitialLink();
      if (initialLink == null) return;
      handleDeepLink(initialLink.link.path);
    } catch (e) {
      // Error
    }
  }

  Future<void> createDynamicLinkAndShare() async {
    AppDialog.showProcess();
    print(StorageHelper().loginData.referralCode);
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://aiwriting.page.link',

      link: Uri.parse('$dynamicLink/${StorageHelper().loginData.referralCode}'),
      androidParameters: const AndroidParameters(
        packageName: 'com.avcodes.ai_writing',
        minimumVersion: 0,
      ),
      // iosParameters: const IOSParameters(
      //   bundleId: 'io.flutter.plugins.firebase.dynamiclinksexample',
      //   minimumVersion: '0',
      // ),
    );

    final ShortDynamicLink shortLink =
        await dynamicLinks.buildShortLink(parameters);
    print(shortLink.shortUrl);
    await Share.share('${AppString.shareText} \n${shortLink.shortUrl}');
    Get.back();
  }

  void handleDeepLink(String path) {
    referCode = path.replaceAll('/', '');
    print(referCode);
  }
}
