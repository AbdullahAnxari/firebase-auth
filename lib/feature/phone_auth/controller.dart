import '../../firebase_authentication.dart';

class PhoneAuthController extends GetxController {
  static final instane = Get.find<PhoneAuthController>();

  String? otp;

  final TextEditingController phoneNo = TextEditingController();
  void setPhoneNum({required String phoneNo}) async {
    await Auth.instance.phoneAuthentication(phoneNo);
  }

  void verifyOTP(String otp) async {
    var isVerified = await Auth.instance.verifyOTP(otp);
    isVerified ? Get.offAll(() => const OtpHome()) : Get.back();
  }

  otpOnComplete(pin) {
    otp = pin;
    verifyOTP(otp!);
  }
}
