import '../../firebase_authentication.dart';

class OTPView extends GetView<PhoneAuthController> {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  Widget get _body => Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'OTP Screen',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 70.0,
              ),
            ),
            OTPTextField(
              length: 6,
              width: 300,
              fieldWidth: 50,
              style: const TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (v) => controller.otpOnComplete(v),
              onChanged: (v) {},
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.verifyOTP(controller.otp!),
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      );

  AppBar get _appBar => AppBar(
        title: const Text('Firebase Auth'),
      );
}
