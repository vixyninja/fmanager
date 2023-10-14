import 'package:firebase_auth/firebase_auth.dart';
import 'package:fmanager/core/routes/key.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthLogic extends GetxController {
  late final GoogleSignIn googleSignIn;
  late final FirebaseAuth firebaseAuth;
  RxBool isLogin = false.obs;

  static const bool isTeacher = true;

  @override
  void onInit() {
    super.onInit();
    googleSignIn = GoogleSignIn(scopes: ['email']);
    firebaseAuth = FirebaseAuth.instance;
    ever(isLogin, (_) {
      if (isLogin.value) {
        switch (isTeacher) {
          case true:
            Get.offAllNamed(RouteKeys.teacherBottom);
            break;
          case false:
            Get.offAllNamed(RouteKeys.managerBottom);
            break;
        }
      } else {
        Get.offAllNamed(RouteKeys.authScreen);
      }
    });
  }

  @override
  onReady() {
    super.onReady();
    isLogin.value = firebaseAuth.currentUser != null;
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signOutGoogle() async {
    try {
      await googleSignIn.signOut();
      await firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
