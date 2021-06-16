class ValidationMixin {
  String validateEmail(String email) {
    if (email.isEmpty) {
      return 'Required Field';
    }
    if (!email.contains('@')) {
      return 'Please enter a valid email';
    }
    if (!email.contains('.com')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String validatePassword(pwd) {
    if (pwd.length < 8) {
      return 'Please enter a minimum of 8 characters';
    }
    return null;
  }
}
