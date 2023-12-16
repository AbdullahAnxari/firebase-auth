import '../../firebase_authentication.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  Widget get _body => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Login')),
          _userUid(),
          _signOutButton(),
        ],
      );

  AppBar get _appBar => AppBar(
        title: const Text('Firebase Auth'),
      );

  Widget _userUid() {
    return Text(controller.user!.email ?? 'user email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: controller.signOut,
      child: const Text('Sign Out'),
    );
  }
}
