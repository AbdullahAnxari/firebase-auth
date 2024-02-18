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
      (userCredentail) => {
        HomeController.instance.setUser(u: userCredentail.user!),
        Get.offAll(() => const HomePage()),
      },
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
      (userCredential) => {
        HomeController.instance.setUser(u: userCredential.user!),
        Get.offAll(() => const HomePage()),
      },
    );
  }

  //*Facebook
  Future<void> facebookAuthentication() async {
    final result = await Auth.instance.signInWithFacebook();

    result.fold(
      (errorMessage) => Get.snackbar('Error', errorMessage),
      (userCredential) => {
        HomeController.instance.setUser(u: userCredential.user!),
        Get.offAll(() => const HomePage()),
      },
    );
  }

  //*Annymously
  Future<void> anonymousLogin() async {
    final result = await Auth().signInAnonumously();
    result.fold(
      (errorMessage) => Get.snackbar('Error', errorMessage),
      (userCredential) => {
        HomeController.instance.setUser(u: userCredential.user!),
        Get.offAll(() => const HomePage()),
      },
    );
  }
}
