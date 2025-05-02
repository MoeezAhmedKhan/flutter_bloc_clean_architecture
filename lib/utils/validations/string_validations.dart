class StringValidations {
  static String? emptyString(String str) {
    if (str.isEmpty) {
      return "Field is empty";
    } else if (str.length < 2) {
      return "Field length should be > 2 characters";
    }
    return null;
  }

  static String? emailString(String str) {
    const emailPattern = r'^[^@]+@[^@]+\.[^@]+$';
    final emailRegExp = RegExp(emailPattern);

    if (str.isEmpty) {
      return "Field is empty";
    } else if (!emailRegExp.hasMatch(str)) {
      return "Email is not valid";
    }
    return null;
  }
}
