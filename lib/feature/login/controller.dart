import '../../firebase_authentication.dart';

class LoginController extends GetxController {
  static final instance = Get.find<LoginController>();
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController phone = TextEditingController();

  //*SingIN
  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().singInWithEmailAndPassword(
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
      update();
    }
  }

  //*Register
  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
      update();
    }
  }

  //*PhoneAuth
  Future<void> phoneAuthenticatio() async {
    try {
      await Auth().phoneAuthentication(phone.text);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
      update();
    }
  }

  //*onPressed
  void func() {
    isLogin = !isLogin;
    update();
  }
}
