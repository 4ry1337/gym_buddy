class SignUpWithEmailAndPasswordException {
  final String message;

  const SignUpWithEmailAndPasswordException([this.message = "An Unknown Error occurred"]);

  factory SignUpWithEmailAndPasswordException.code(String code){
    switch(code){
      case 'weak-password':
        return const SignUpWithEmailAndPasswordException('Please enter stronger password');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordException('Email is not valid');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordException('Email is already in use');
      default:
        return SignUpWithEmailAndPasswordException();
    }
  }
}