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

  Widget get _body => GetBuilder<HomeController>(initState: (_) {
        ConnectivityController.instance.checkInternet();
      }, builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                color: Colors.deepPurpleAccent,
                child: const Center(
                  child: Text('Home Screen'),
                ),
              ),
              const Spacer(),
              _userUid(),
              const SizedBox(height: 20),
              _signOutButton(),
              const Spacer(),
            ],
          ),
        );
      });

  AppBar get _appBar => AppBar(
        title: const Text('Firebase Auth'),
      );

  Widget _userUid() {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          border: Border.all(
            color: Colors.deepPurpleAccent,
            width: 5.0,
          ),
        ),
        child: Text('Email: ${controller.user!.email}'));
  }

  Widget _signOutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: controller.signOut,
        child: const Text('Sign Out'),
      ),
    );
  }
}
