import '../../firebase_authentication.dart';

class PhoneAuthController extends GetxController {
  static final instane = Get.find<PhoneAuthController>();

  String? otp;

  final TextEditingController phoneNo = TextEditingController();
  void setPhoneNum({required String phoneNo}) async {
    await Auth.instance.phoneAuthentication(phoneNo);
  }

  void verifyOTP(String otp) async {
    final result = await Auth.instance.verifyOTP(otp);
    result.fold(
      (errorMessage) => Get.snackbar('Error', errorMessage),
      (isVerified) =>
          isVerified ? Get.offAll(() => const HomePage()) : Get.back(),
    );
  }

  otpOnComplete(pin) {
    otp = pin;
    verifyOTP(otp!);
  }
}
