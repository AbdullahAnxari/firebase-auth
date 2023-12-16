import '../../firebase_authentication.dart';

class WidgetTree extends GetView {
  const WidgetTree({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
    );
  }

  Widget get _body => GetBuilder<HomeController>(builder: (_) {
        return StreamBuilder(
          stream: Auth.instance.authStateChanges,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //*Phone Auth
                      //!error
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => controller.m,
                          child: const Text('PhoneAuth'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      //*LoginView
                      //! Error
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: controller.moveToLoginView,
                          child: const Text('Login'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      //*Register
                      //!error
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: controller.moveToLoginView,
                          child: const Text('Register'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        );
      });
}
