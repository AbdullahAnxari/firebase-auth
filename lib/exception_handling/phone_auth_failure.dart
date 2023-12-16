/// {@template phone_auth_failure}
/// Thrown during the phone authentication process if a failure occurs.
/// {@endtemplate}
class PhoneAuthFailure implements Exception {
  /// {@macro phone_auth_failure}
  const PhoneAuthFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a Firebase phone authentication exception code.
  factory PhoneAuthFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-phone-number':
        return const PhoneAuthFailure(
          'Invalid phone number. Please enter a valid phone number.',
        );
      case 'missing-phone-number':
        return const PhoneAuthFailure(
          'Phone number is missing. Please provide a phone number.',
        );
      case 'quota-exceeded':
        return const PhoneAuthFailure(
          'SMS quota exceeded. Please try again later.',
        );
      case 'code-expired':
        return const PhoneAuthFailure(
          'The SMS code has expired. Please request a new one.',
        );
      case 'invalid-verification-code':
        return const PhoneAuthFailure(
          'The entered verification code is invalid. Please try again.',
        );
      case 'session-expired':
        return const PhoneAuthFailure(
          'The phone authentication session has expired. Please try again.',
        );
      case 'invalid-verification-id':
        return const PhoneAuthFailure(
          'The verification ID is invalid. Please request a new one.',
        );
      case 'user-disabled':
        return const PhoneAuthFailure(
          'This user has been disabled. Please contact support for help.',
        );
      default:
        return const PhoneAuthFailure();
    }
  }

  /// The associated error message.
  final String message;
}
