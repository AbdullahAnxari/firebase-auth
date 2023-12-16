import 'package:auth_firebase/exception_handling/login_with_anonymous_failure.dart';
import 'package:auth_firebase/exception_handling/login_with_email_pass_failure.dart';
import 'package:auth_firebase/exception_handling/login_with_facebook_failure.dart';
import 'package:auth_firebase/exception_handling/login_with_google_failure.dart';
import 'package:auth_firebase/exception_handling/phone_auth_failure.dart';

import '../../firebase_authentication.dart';

class LoginController extends GetxController {
  static final instance = Get.find<LoginController>();
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController google = TextEditingController();

  //*SingIN
  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().singInWithEmailAndPassword(
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
    } on FirebaseException catch (e) {
      final newErrorMessage = LogInWithEmailAndPasswordFailure.fromCode(e.code);
      Get.snackbar('Error', newErrorMessage.message);
      update();
    }
  }

  //*PhoneAuth
  Future<void> phoneAuthenticatio() async {
    try {
      await Auth().phoneAuthentication(phone.text);
    } on FirebaseException catch (e) {
      final newErrorMessage = PhoneAuthFailure.fromCode(e.code);
      Get.snackbar('Error', newErrorMessage.message);
      update();
    }
  }

  //*Google
  Future<void> googleAuthentication() async {
    try {
      await Auth().signInWithGoogle();
    } on FirebaseException catch (e) {
      final newErrorMessage = LogInWithGoogleFailure.fromCode(e.code);
      Get.snackbar('Error', newErrorMessage.message);
      update();
    }
  }

  //*Facebook
  Future<void> facebookAuthentication() async {
    try {
      await Auth().signInWithFacebook();
    } on FirebaseException catch (e) {
      final newErrorMessage = LogInWithFacebookFailure.fromCode(e.code);
      Get.snackbar('Error', newErrorMessage.message);
      update();
    }
  }

  //*Annymously
  Future<void> anonymousLogin() async {
    try {
      await Auth().signInAnonumously();
    } on FirebaseException catch (e) {
      final newErrorMessage = LogInAnonymouslyFailure.fromCode(e.code);
      Get.snackbar('Error', newErrorMessage.message);
      update();
    }
  }

  //*onPressed
  void func() {
    isLogin = !isLogin;
    update();
  }
}
