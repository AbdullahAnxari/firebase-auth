import '../../firebase_authentication.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

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
    return Text(user?.email ?? 'user email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }
}
