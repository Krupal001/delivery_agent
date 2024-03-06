class SignupWithEmailAndPasswordFailure{
  final String message;
  const SignupWithEmailAndPasswordFailure([this.message="An Unknown error occured."]);


  factory SignupWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password':
        return const SignupWithEmailAndPasswordFailure('please enter a stronger password');
      case 'invalid-email':
        return const SignupWithEmailAndPasswordFailure('Email is not valid');
      case 'email-already-in-use':
        return const SignupWithEmailAndPasswordFailure('An Account is Already Exists!');
      default:
        return const SignupWithEmailAndPasswordFailure();
    }
  }

}
