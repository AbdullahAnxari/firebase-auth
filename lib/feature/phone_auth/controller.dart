import '../../firebase_authentication.dart';

class PhoneAuthController extends GetxController {
  static final instane = Get.find<PhoneAuthController>();

  final TextEditingController phoneNo = TextEditingController();
  void setPhoneNum({required String phoneNo}) async {
    await Auth.instance.phoneAuthentication(phoneNo);
  }

  void  verifyOTP(String otp) async {
    var isVerified =  await Auth.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const PhoneAuthView()) : Get.back(); 
  }
}
