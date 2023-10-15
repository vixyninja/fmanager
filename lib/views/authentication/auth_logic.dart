import 'package:firebase_auth/firebase_auth.dart';
import 'package:fmanager/core/routes/key.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthLogic extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late Rx<User?> user = Rx<User?>(null);

  // !! Change this to true if you want to test teacher screen
  static const bool isTeacher = false;

  setStateScreen() async {
    try {
      user.value = firebaseAuth.currentUser;
      if (user.value != null) {
        if (isTeacher) {
          await Get.offAllNamed(RouteKeys.teacherBottom);
        } else {
          await Get.offAllNamed(RouteKeys.managerBottom);
        }
      } else {
        await Get.offAllNamed(RouteKeys.authScreen);
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await firebaseAuth.signInWithCredential(credential).then((value) async {
        user.value = value.user;
        await setStateScreen();
        return value;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signOutGoogle() async {
    try {
      await googleSignIn.signOut();
      await firebaseAuth.signOut().whenComplete(() async {
        user.value = null;
        await setStateScreen();
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
