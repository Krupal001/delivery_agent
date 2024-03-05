class LoginWithEmailAndPasswordFailure {
  final String message;

  const LoginWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occured."]);

  factory LoginWithEmailAndPasswordFailure.code(String code){
    switch (code) {
      case 'wrong-password':
        return const LoginWithEmailAndPasswordFailure(
            'please enter a valid password');
      case 'invalid-email':
        return const LoginWithEmailAndPasswordFailure('Email is not valid');
      case 'email-not-registered':
        return const LoginWithEmailAndPasswordFailure(
            "An Account is Don't Exists!");
      default:
        return const LoginWithEmailAndPasswordFailure();
    }
  }
}