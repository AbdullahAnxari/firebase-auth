import 'package:auth_firebase/firebase_authentication.dart';

class OtpHome extends GetView {
  const OtpHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('OTP and Phone Auth successfully done'),
      ),
    );
  }
}
