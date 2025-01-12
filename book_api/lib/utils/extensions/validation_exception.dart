
extension EmailValidatorException on String{
  bool emailValidator(){
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(this);
    return emailValid;
  }
}

extension PasswordValidatorExtension on String {
  bool passwordValidator() {
    /// Define the password rules:
    /// 1. At least 8 characters
    /// 2. At least one uppercase letter
    /// 3. At least one lowercase letter
    /// 4. At least one digit
    /// 5. At least one special character
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

    return passwordRegex.hasMatch(this);
  }
}
