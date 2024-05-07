class FormValidators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    }
    return null;
  }

  static String? validateEmail(value) {
    if (value == null || value!.isEmpty) {
      return 'please enter email.com';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{3,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'please enter validate email';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    if (value.length != 10) {
      return "please Enter 10 Digits ";
    }
    return null;
  }
}
