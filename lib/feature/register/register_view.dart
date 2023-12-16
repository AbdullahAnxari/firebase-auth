import 'package:auth_firebase/firebase_authentication.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  //*
  Widget get _body => Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _textField('email', controller.controllerEmail, Icons.email),
            const SizedBox(height: 10),
            _textField(
                'password', controller.controllerPassword, Icons.password),
            _errorMessage(),
            _submitButton(),
            Align(
              alignment: Alignment.bottomRight,
              child: _loginOrRegistrationButton(),
            ),
          ],
        ),
      );

  AppBar get _appBar => AppBar(
        title: const Text('Register Screen'),
        centerTitle: true,
      );

  Widget _textField(
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
    return GetBuilder<RegisterController>(builder: (_) {
      return Text(
          controller.errorMessage == '' ? '' : '${controller.errorMessage}');
    });
  }

  Widget _submitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          controller.createUserWithEmailAndPassword;
          Get.to(const PhoneAuthView());
        },
        child: const Text('Register'),
      ),
    );
  }

  Widget _loginOrRegistrationButton() {
    return TextButton(
      onPressed: () => Get.to(const LoginView()),
      child: const Text('Login instead'),
    );
  }
}
