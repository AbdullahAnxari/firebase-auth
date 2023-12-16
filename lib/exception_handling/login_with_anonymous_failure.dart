/// {@template log_in_anonymously_failure}
/// Thrown during the anonymous sign-in process if a failure occurs.
/// {@endtemplate}
class LogInAnonymouslyFailure implements Exception {
  /// {@macro log_in_anonymously_failure}
  const LogInAnonymouslyFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a Firebase anonymous authentication exception code.
  factory LogInAnonymouslyFailure.fromCode(String code) {
    switch (code) {
      case 'operation-not-allowed':
        return const LogInAnonymouslyFailure(
          'Anonymous sign-in is not allowed. Please contact support.',
        );
      case 'user-disabled':
        return const LogInAnonymouslyFailure(
          'This user has been disabled. Please contact support for help.',
        );
      default:
        return const LogInAnonymouslyFailure();
    }
  }

  /// The associated error message.
  final String message;
}
