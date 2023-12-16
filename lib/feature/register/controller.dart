import 'package:auth_firebase/firebase_authentication.dart';

class RegisterController extends GetxController {
  static final intance = Get.find<RegisterController>();

  String? errorMessage = '';
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  //*Register
  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
    } on FirebaseException catch (e) {
      final newErrorMessage =
          SignUpWithEmailAndPasswordFailure.fromCode(e.code);
      Get.snackbar('Error', newErrorMessage.message);
      update();
    } 
  }
}
