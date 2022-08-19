import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

enum SupportState {
  unknown,
  supported,
  unsupported,
}


class AuthController extends GetxController{
  final LocalAuthentication auth = LocalAuthentication();
  var _supportState = SupportState.unknown.obs;
  SupportState get supportState => _supportState.value;
  var _canCheckBiometrics = false.obs;
  bool get canCheckBiometrics => _canCheckBiometrics.value;
  var _availableBiometrics = <BiometricType>[].obs;
  List<BiometricType>? get availableBiometrics => _availableBiometrics.value;
  var _authorized = 'Not Authorized'.obs;
  String get authorized => _authorized.value;
  var _isAuthenticating = false.obs;
  bool get isAuthenticating => _isAuthenticating.value;

  @override
  void onInit() {
    auth.isDeviceSupported().then(
          (bool isSupported) {
            _supportState.value = isSupported
                ? SupportState.supported
                : SupportState.unsupported;},
    );
    super.onInit();
  }

  Future<void> checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    // if (!mounted) {
    //   return;
    // }
    _canCheckBiometrics.value = canCheckBiometrics;
  }

  Future<void> getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    // if (!mounted) {
    //   return;
    // }

    _availableBiometrics.value = availableBiometrics;

  }

  Future<void> authenticate() async {
    bool authenticated = false;
    try {
      _isAuthenticating.value = true;
      _authorized.value = 'Authenticating';

      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );

      _isAuthenticating.value = false;

    } on PlatformException catch (e) {
      print(e);
      _isAuthenticating.value = false;
      _authorized.value = 'Error - ${e.message}';
      return;
    }
    // if (!mounted) {
    //   return;
    // }

    _authorized.value = authenticated ? 'Authorized' : 'Not Authorized';

  }

  Future<void> authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      _isAuthenticating.value = true;
      _authorized.value = 'Authenticating';


      authenticated = await auth.authenticate(
        localizedReason:
        'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      _isAuthenticating.value = false;
      _authorized.value = 'Authenticating';


    } on PlatformException catch (e) {
      print(e);
      _isAuthenticating.value = false;
      _authorized.value = 'Error - ${e.message}';
      return;
    }
    // if (!mounted) {
    //   return;
    // }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    _authorized.value = message;

  }

  Future<void> cancelAuthentication() async {
    await auth.stopAuthentication();
    _isAuthenticating.value = false;
  }



}