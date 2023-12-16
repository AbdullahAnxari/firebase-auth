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
          home: const RegisterView(),
          // home: const PhoneAuthView(),
        );
      },
    );
  }
}
// # firebase_core: ^2.21.0
//   get: ^4.6.6
//   # flutter_screenutil: ^5.9.0
//   # connectivity_plus: ^5.0.1
//   # internet_connection_checker: ^1.0.0+1
//   # firebase_auth: ^4.14.1
//   # google_fonts: ^6.1.0
//   # otp_text_field: ^1.1.3
//   # flutter_otp_text_field: ^1.1.1
//   # google_sign_in: ^6.1.6
//   # firebase_core: ^2.24.0
//   # fluttertoast: ^8.2.4