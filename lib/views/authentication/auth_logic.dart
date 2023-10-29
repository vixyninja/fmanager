import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fmanager/core/routes/key.dart';
import 'package:fmanager/data/data.dart';
import 'package:fmanager/main.dart';
import 'package:fmanager/models/models.dart';
import 'package:fmanager/utils/utils.dart';
import 'package:fmanager/views/common/common_alert.dart';
import 'package:fmanager/views/widgets/loading/loading_logic.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

enum SupportState {
  unknown,
  supported,
  unsupported,
}

class AuthLogic extends GetxController {
  final LoadingLogic loadingLogic = Get.find<LoadingLogic>();
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth firebaseAuth = FirebaseAuth.instanceFor(app: firebaseApp);
  final LocalAuthentication auth = LocalAuthentication();

  // Repository
  late UserModel? userModel;
  final ApiServices apiServices = Get.find<ApiServices>();
  final UserRepository userRepository = Get.find<UserRepository>();

  late Rx<User?> user = Rx<User?>(null);

  late RxString _place = RxString('');
  RxString get place => _place;
  set place(RxString value) {
    _place = value;
    StorageManager.write(StorageKeys.place.toString(), _place.value.toString());
    update();
  }

  // !! Change this to true if you want to test teacher screen
  RxBool isTeacher = RxBool(true);

  bool _enableBiometric = false;
  bool get enableBiometric => _enableBiometric;
  set enableBiometric(bool value) {
    _enableBiometric = value;
    StorageManager.write(StorageKeys.biometric.toString(), _enableBiometric);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    initPlace();
    initBiometric();
    if (enableBiometric) {
      authenticate();
    }
  }

  void initBiometric() {
    if (StorageManager.read<bool>(StorageKeys.biometric.toString(), false) != null) {
      enableBiometric = StorageManager.read<bool>(StorageKeys.biometric.toString(), false)!;
    } else {
      enableBiometric = false;
    }
  }

  void initPlace() {
    if (StorageManager.read<String>(StorageKeys.place.toString(), '') != null) {
      place = StorageManager.read<String>(StorageKeys.place.toString(), '')!.obs;
    } else {
      place = ''.obs;
    }
  }

  Future<void> signInWithGoogle() async {
    if (place.value == '') {
      CommonAlert.showSnackBar('Thông báo', 'Vui lòng chọn cơ sở', position: SnackPosition.TOP);
      return;
    }
    loadingLogic.showLoading();
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await firebaseAuth.signInWithCredential(credential);
      final String? idToken = await firebaseAuth.currentUser!.getIdToken();
      final Either<Exception, TokenModel> either =
          await userRepository.loginGoogleGolang(idToken: idToken!, position: place.value);
      either.fold(
        (l) {
          CommonAlert.showSnackBar('Thông báo', 'Có lỗi xảy ra, vui lòng thử lại', position: SnackPosition.TOP);
        },
        (r) async {
          await StorageManager.write(StorageKeys.accessToken.toString(), r.accessToken.toString());
          await StorageManager.write(StorageKeys.refreshToken.toString(), r.refreshToken.toString());
          await getMyProfile();
        },
      );
    } catch (e) {
      CommonAlert.showSnackBar('Thông báo', 'Có lỗi xảy ra, vui lòng thử lại', position: SnackPosition.TOP);
    } finally {
      Future.delayed(const Duration(seconds: 2), () {
        loadingLogic.hideLoading();
      });
    }
  }

  Future<void> getMyProfile() async {
    try {
      final Either<Exception, UserModel> either = await userRepository.getMyProfile();
      either.fold(
        (l) {
          CommonAlert.showSnackBar('Thông báo', 'Có lỗi xảy ra, vui lòng thử lại', position: SnackPosition.TOP);
        },
        (r) {
          if (RoleEnum.TEACHER.toString() == r.role.toString()) {
            isTeacher.value = true;
            userModel = r;
            Get.offAllNamed(RouteKeys.teacherBottom);
          } else {
            userModel = r;
            isTeacher.value = false;
            Get.offAllNamed(RouteKeys.managerBottom);
          }
        },
      );
    } catch (e) {
      CommonAlert.showSnackBar('Thông báo', 'Có lỗi xảy ra, vui lòng thử lại', position: SnackPosition.TOP);
    }
  }

  Future<void> signOutGoogle() async {
    loadingLogic.showLoading();
    try {
      await googleSignIn.signOut();
      await firebaseAuth.signOut().whenComplete(() {
        userModel = UserModel.createEmptyInstance();
        Get.offAllNamed(RouteKeys.authScreen);
      });
      enableBiometric = false;
      place.value = '';
      StorageManager.clearKey(StorageKeys.biometric.toString());
      StorageManager.clearKey(StorageKeys.place.toString());
    } catch (e) {
      print(e.toString());
      CommonAlert.showSnackBar('Thông báo', 'Có lỗi xảy ra, vui lòng thử lại', position: SnackPosition.TOP);
    } finally {
      Future.delayed(const Duration(seconds: 2), () {
        loadingLogic.hideLoading();
      });
    }
  }

  Future<void> authenticate() async {
    final bool canCheckBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate = canCheckBiometrics || await auth.isDeviceSupported();

    final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      MyLogger().i('availableBiometrics: $availableBiometrics');
    }

    if (availableBiometrics.contains(BiometricType.strong) &&
        availableBiometrics.contains(BiometricType.face) &&
        availableBiometrics.contains(BiometricType.fingerprint)) {
      MyLogger().i(
          'BiometricType.strong: ${BiometricType.strong} BiometricType.face: ${BiometricType.face} BiometricType.fingerprint: ${BiometricType.fingerprint}');
    }

    if (!canAuthenticate) {
      MyLogger().i('canAuthenticate: $canAuthenticate');
      return;
    }
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Vui lòng xác thực bằng vân tay hoặc khuôn mặt',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
          sensitiveTransaction: true,
        ),
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Biometric Authentication',
            cancelButton: 'Đóng',
            biometricHint: 'Chạm vào cảm biến vân tay',
            biometricNotRecognized: 'Lỗi xác thực vân tay',
            biometricRequiredTitle: 'Yêu cầu xác thực vân tay',
            biometricSuccess: 'Xác thực thành công',
            deviceCredentialsRequiredTitle: 'Yêu cầu xác thực thiết bị',
            deviceCredentialsSetupDescription:
                'Vui lòng thiết lập thông tin xác thực thiết bị của bạn trước khi sử dụng ứng dụng.',
            goToSettingsButton: 'Đi tới cài đặt',
            goToSettingsDescription:
                'Vui lòng thiết lập thông tin xác thực thiết bị của bạn trước khi sử dụng ứng dụng',
          ),
        ],
      );
      if (didAuthenticate) {
        signInWithGoogle();
      } else {
        signOutGoogle();
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        print('notAvailable ${e.code}');
      } else if (e.code == auth_error.biometricOnlyNotSupported) {
        print('biometricOnlyNotSupported ${e.code}');
      } else if (e.code == auth_error.lockedOut) {
        print('lockedOut ${e.code}');
      } else if (e.code == auth_error.notEnrolled) {
        print('notEnrolled ${e.code}');
      } else if (e.code == auth_error.otherOperatingSystem) {
        print('otherOperatingSystem ${e.code}');
      } else if (e.code == auth_error.passcodeNotSet) {
        print('passcodeNotSet ${e.code}');
      } else if (e.code == auth_error.permanentlyLockedOut) {
        print('permanentlyLockedOut ${e.code}');
      } else {
        print('other ${e.code}');
      }
    } catch (e) {
      print('other $e');
    }
  }
}
