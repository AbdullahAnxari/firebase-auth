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
    final result = await Auth.instance.singInWithEmailAndPassword(
      email: controllerEmail.text,
      password: controllerPassword.text,
    );

    result.fold(
      (errorMessage) => Get.snackbar('Error', errorMessage),
      (userCredentail) => null,
    );
  }

  //*PhoneAuth
  Future<void> phoneAuthenticatio() async {
    final result = await Auth.instance.phoneAuthentication(phone.text);

    result.fold(
      (errorMessage) => Get.snackbar('Error', errorMessage),
      (r) => null,
    );
  }

  //*Google
  Future<void> googleAuthentication() async {
    final result = await Auth.instance.signInWithGoogle();
    result.fold(
      (errorMessage) => Get.snackbar('Error', errorMessage),
      (r) => null,
    );
  }

  //*Facebook
  Future<void> facebookAuthentication() async {
    final result = await Auth.instance.signInWithFacebook();
    result.fold(
      (errorMessage) => Get.snackbar('Error', errorMessage),
      (r) => null,
    );
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
