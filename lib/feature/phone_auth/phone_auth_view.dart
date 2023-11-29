import 'package:auth_firebase/feature/otp_screen/otp_screen.dart';

import '../../firebase_authentication.dart';

class PhoneAuthView extends GetView<PhoneAuthController> {
  const PhoneAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  Widget get _body => Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _entryField('phone', controller.phoneNo),
            TextButton(
              onPressed: () {
                controller.setPhoneNum(phoneNo: controller.phoneNo.text);
                Get.to(OTPView());
              },
              child: const Text('Send OTP'),
            ),
          ],
        ),
      );

  AppBar get _appBar => AppBar(
        title: const Text('Firebase Auth'),
      );

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }
}
