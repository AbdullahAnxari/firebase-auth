import 'package:auth_firebase/firebase_authentication.dart';

class HomeController extends GetxController {
  static final instance = Get.find<HomeController>();
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  void moveToPhonAuth() => Get.to(const PhoneAuthView());

  void moveToLoginView() => Get.to(const LoginView());
}
