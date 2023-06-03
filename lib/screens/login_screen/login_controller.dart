import 'dart:io';
import 'package:ai_writing/screens/login_screen/login_model.dart';
import 'package:ai_writing/utils/config_packages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late final User user;

  login() async {
    AppDialog.showProcess();

    final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: Platform.isAndroid
            ? AppConst.androidClientID
            : AppConst.iosClientID);
    googleSignIn.signIn().then((googleSignInAccount) {
      if (googleSignInAccount != null) {
        googleSignInAccount.authentication.then((googleSignInAuthentication) {
          final AuthCredential authCredential = GoogleAuthProvider.credential(
              idToken: googleSignInAuthentication.idToken,
              accessToken: googleSignInAuthentication.accessToken);
          auth.signInWithCredential(authCredential).then((result) {
            user = result.user!;

            FirebaseMessaging.instance
                .getToken()
                .then((value) => callLoginApi(value!))
                .onError((error, stackTrace) => callLoginApi('nope'));
          }).onError((error, stackTrace) {
            Get.back();
            debugPrint(error.toString());
          });
        }).onError((error, stackTrace) {
          Get.back();
          debugPrint(error.toString());
        });
      } else {
        Get.back();
      }
    }).onError((error, stackTrace) {
      Get.back();
      debugPrint(error.toString());
    });
  }

  callLoginApi(String token) {
    ApiManager.callPost(
      ApiUtils.baseUrl + ApiUtils.socialLogin,
      body: {
        ApiParam.name: user.displayName.toString(),
        ApiParam.email: user.email.toString(),
        ApiParam.profile: user.photoURL.toString(),
        ApiParam.provider: 'Gmail',
        ApiParam.devicetoken: token,
        ApiParam.deviceType: Platform.isAndroid ? '0' : '1',
      },
    ).then((value) {
      LoginModel response = LoginModel.fromJson(value);
      StorageHelper().loginData = response.data!;
      StorageHelper().isLoggedIn = true;
      print('Auth token ${StorageHelper().loginData.authtoken}');
      Get.offUntil(GetPageRoute(page: () => HomeScreen()), (route) => false);
    }).onError((error, stackTrace) {
      Get.back();
      AppDialog.errorSnackBar(error.toString());
    });
  }
}
