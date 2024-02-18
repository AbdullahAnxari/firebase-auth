import 'package:auth_firebase/firebase_authentication.dart';

class RegisterController extends GetxController {
  static final intance = Get.find<RegisterController>();

  String? errorMessage = '';
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
 
  //*Register
  Future<void> createUserWithEmailAndPassword() async {
    final result = await Auth().createUserWithEmailAndPassword(
      email: controllerEmail.text,
      password: controllerPassword.text,
    );
    result.fold(
      (errorMessage) => Get.snackbar('Error', errorMessage),
      (userCredential) => {
        HomeController.instance.setUser(u: userCredential.user!),
        Get.offAll(() => const HomePage()),
      },
    );
    // final newErrorMessage =
    //     SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    // Get.snackbar('Error', newErrorMessage.message);
    // update();
  }
}
