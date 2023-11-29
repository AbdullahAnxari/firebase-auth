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
            _entryField('email', controller.controllerEmail),
            _entryField('password', controller.controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegistrationButton(),
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

  Widget _errorMessage() {
    return Text(controller.errorMessage == '' ? '' : '${controller.errorMessage}');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
          controller.isLogin ? controller.signInWithEmailAndPassword : controller.createUserWithEmailAndPassword,
      child: Text(controller.isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegistrationButton() {
    return TextButton(
        onPressed: controller.func,
        child: Text(controller.isLogin ? 'Register instead' : 'Login instead'));
  }
}
