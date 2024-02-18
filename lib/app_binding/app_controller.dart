
import '../firebase_authentication.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {  
    ///Networking
    // Get.put(ConnectionServices());

    ///Controllers
    // Get.put(HomeController());
    Get.put(PhoneAuthController());
    Get.put(LoginController());
    Get.put(RegisterController());
    Get.put(HomeController());
    Get.put(ConnectivityController());
  }
}
