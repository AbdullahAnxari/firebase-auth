import '../../firebase_authentication.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth.instance.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return const PhoneAuthView();
          // return const LoginView();
        }
      },
    );
  }
}
