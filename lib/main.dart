import 'firebase_authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FirebaseReadApp());
}

class FirebaseReadApp extends StatefulWidget {
  const FirebaseReadApp({super.key});

  @override
  State<FirebaseReadApp> createState() => _FirebaseReadAppState();
}

class _FirebaseReadAppState extends State<FirebaseReadApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: AppBinding(),
          title: 'Firebase firebase_cloud_store',
          debugShowCheckedModeBanner: false,
          home: const PhoneAuthView(),
        );
      },
    );
  }
}
