import 'package:firebase_auth/firebase_auth.dart';
import 'package:fmanager/core/routes/key.dart';
import 'package:fmanager/core/widgets/loading/loading_logic.dart';
import 'package:fmanager/main.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthLogic extends GetxController {
  final LoadingLogic loadingLogic = Get.find<LoadingLogic>();
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth firebaseAuth = FirebaseAuth.instanceFor(app: firebaseApp);
  late Rx<User?> user = Rx<User?>(null);

  // !! Change this to true if you want to test teacher screen
  static const bool isTeacher = true;

  setStateScreen() {
    try {
      user.value = firebaseAuth.currentUser;
      if (user.value != null) {
        if (isTeacher) {
          Get.offAllNamed(RouteKeys.teacherBottom);
        } else {
          Get.offAllNamed(RouteKeys.managerBottom);
        }
      } else {
        Get.offAllNamed(RouteKeys.authScreen);
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }

  Future<void> signInWithGoogle() async {
    loadingLogic.showLoading();
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await firebaseAuth.signInWithCredential(credential).then((value) async {
        print('User IdToken: ${await firebaseAuth.currentUser!.getIdToken()}');
        user.value = value.user;
        setStateScreen();
        return value;
      });
    } catch (e) {
      print(e.toString());
    } finally {
      Future.delayed(const Duration(seconds: 2), () {
        loadingLogic.hideLoading();
      });
    }
  }

  Future<void> signOutGoogle() async {
    loadingLogic.showLoading();
    try {
      await googleSignIn.signOut();
      await firebaseAuth.signOut().whenComplete(() {
        user.value = null;
        setStateScreen();
      });
    } catch (e) {
      print(e.toString());
    } finally {
      Future.delayed(const Duration(seconds: 2), () {
        loadingLogic.hideLoading();
      });
    }
  }
}
