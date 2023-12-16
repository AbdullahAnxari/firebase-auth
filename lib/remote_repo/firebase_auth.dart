import '../firebase_authentication.dart';

class Auth {
  //* Singleton pattern
  static final Auth _instance = Auth();
  static Auth get instance => _instance;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var verificationId = ''.obs;
  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  //*SignIn
  Future<Either<String, UserCredential>> singInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(userCredential);
    } on FirebaseException catch (e) {
      final error = LogInWithEmailAndPasswordFailure.fromCode(e.code);
      return left(error.message);
    }
  }

  //*Register
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    debugPrint('Email $email');
  }

  //*SignOut
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  //*Phone Authentication
  Future<Either<String, void>> phoneAuthentication(String phoneNo) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          UserCredential user =
              await _firebaseAuth.signInWithCredential(credential);
          debugPrint('USer: $user');
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The provided phone number is not valid');
          } else {
            Get.snackbar('Error', 'Something went wrong');
          }
        },
      );
      return right(null);
    } on FirebaseException catch (e) {
      final error = PhoneAuthFailure.fromCode(e.code);
      return left(error.message);
    }
  }

  //*OTP
  Future<Either<String, bool>> verifyOTP(String otp) async {
    try {
      var credentials = await _firebaseAuth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationId.value,
          smsCode: otp,
        ),
      );
      return right(credentials.user != null ? true : false);
    } on FirebaseException catch (e) {
      final error = PhoneAuthFailure.fromCode(e.code);
      return left(error.message);
    }
  }

  //*Google
  Future<Either<String, UserCredential>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredentail =
          await _firebaseAuth.signInWithCredential(credential);
      return right(userCredentail);
    } on FirebaseException catch (e) {
      final error = LogInWithGoogleFailure.fromCode(e.code);
      return left(error.message);
    }
  }

  //*Anonymous
  Future<void> signInAnonumously() async {
    try {
      await _firebaseAuth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Anonymous', e.message!);
    }
  }

  //*Facebook
  Future<Either<String, UserCredential>> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      final userCredentail = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      return right(userCredentail);
    } on FirebaseException catch (e) {
      final error = LogInWithFacebookFailure.fromCode(e.code);
      return left(error.message);
    }
  }
}
