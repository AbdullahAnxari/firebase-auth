import 'package:auth_firebase/feature/otp_screen/otp_screen.dart';

import '../../firebase_authentication.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
            _entryField('email', controller.controllerEmail, Icons.email),
            const SizedBox(height: 10),
            _entryField(
                'password', controller.controllerPassword, Icons.password),
            _errorMessage(),
            _submitButton(),
            _loginOrRegistrationButton(),
            const SizedBox(height: 20),
            SizedBox(width: double.infinity,
            child: ElevatedButton(onPressed: ()=> Get.to(const OTPView()), child: const Text('Login with OTP')),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //*Google
                Column(
                  children: [
                    _socialLogo(
                      icon: const Icon(Icons.login),
                      onTap: controller.googleAuthentication,
                    ),
                    const Text('Google')
                  ],
                ),
                const SizedBox(width: 20),
                //*Facebook
                Column(
                  children: [
                    _socialLogo(
                      icon: const Icon(Icons.facebook),
                      onTap: controller.facebookAuthentication,
                    ),
                    const Text('Facebook')
                  ],
                ),
                const SizedBox(width: 20),
                //*Anonymous
                Column(
                  children: [
                    _socialLogo(
                      icon: const Icon(Icons.login),
                      onTap: controller.anonymousLogin,
                    ),
                    const Text('Anony')
                  ],
                ),
              ],
            )
          ],
        ),
      );

  AppBar get _appBar => AppBar(
        title: const Text('Firebase Auth'),
      );

  Widget _entryField(
      String title, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        errorStyle: const TextStyle(height: 0),
        hintStyle: const TextStyle(
          color: Color(0xffADA4A5),
        ),
        border: InputBorder.none,
        hintText: title,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            top: 0.2,
          ),
          child: Icon(
            icon,
            color: const Color(0xff7B6F72),
          ),
        ),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(
        controller.errorMessage == '' ? '' : '${controller.errorMessage}');
  }

  Widget _submitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: controller.signInWithEmailAndPassword,
        child: Text(controller.isLogin ? 'Login' : 'Register'),
      ),
    );
  }

  Widget _loginOrRegistrationButton() {
    return TextButton(
      onPressed: () => Get.to(const RegisterView()),
      child: const Text('Register instead'),
    );
  }

  Widget _socialLogo({required Icon icon, required VoidCallback onTap}) =>
      Column(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              onPressed: onTap,
              icon: icon,
            ),
          )
        ],
      );
}


