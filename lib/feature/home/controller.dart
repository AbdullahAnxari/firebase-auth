import 'package:auth_firebase/firebase_authentication.dart';

class HomeController extends GetxController {
  static final instance = Get.find<HomeController>();
  User? _user = Auth.instance.currentUser;
  User? get user => _user;
  void setUser({required User u}) {
    _user = u;
    update();
  }

  Future<void> signOut() async {
    await Auth.instance.signOut();
    Auth.instance.authStateChanges.listen((user) {
      if (user == null) {
        Get.to(() => const LoginView());
      }
    });
  }

  // void moveToPhonAuth() => Get.to(const PhoneAuthView());

  // void moveToLoginView() => Get.to(const LoginView());
}
