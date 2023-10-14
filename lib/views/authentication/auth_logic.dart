import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthLogic extends GetxController {
  late final GoogleSignIn googleSignIn;
  late final FirebaseAuth firebaseAuth;

  late final RxBool _isLogin = false.obs;

  bool get isLogin => _isLogin.value;
  set setIsLogin(bool value) => _isLogin.value = value;

  User get user => firebaseAuth.currentUser.obs.value!;

  @override
  void onInit() {
    super.onInit();
    googleSignIn = GoogleSignIn(scopes: ['email']);
    firebaseAuth = FirebaseAuth.instance;
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
      setIsLogin = true;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signOutGoogle() async {
    try {
      await googleSignIn.signOut();
      await firebaseAuth.signOut();
      setIsLogin = false;
    } catch (e) {
      print(e.toString());
    }
  }
}
