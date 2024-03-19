final class AuthPageValidations {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static String? emailValidator(String? value) {
    final vals = <String>[];
    if (value == null || value.isEmpty) {
      vals.add('Please enter your email');
    }
    if (!_emailRegExp.hasMatch(value ?? '')) {
      vals.add('Please enter a valid email');
    }
    return _toValidator(vals);
  }

  static String? passwordValidator(String? value) {
    final vals = <String>[];
    if (value == null || value.isEmpty) {
      vals.add('Please enter your password');
    }
    if ((value ?? '').length < 8) {
      vals.add('Password must be at least 6 characters');
    }
    return _toValidator(vals);
  }

  static String? repasswordValidator(String? value, String password) {
    final vals = <String>[];
    if (value == null || value.isEmpty) {
      vals.add('Please re-enter your password');
    }
    if (value != password) {
      vals.add('Passwords do not match');
    }
    return _toValidator(vals);
  }

  static String? _toValidator(List<String> vals) {
    return vals.isNotEmpty ? vals.map((e) => "• $e").join("\n") : null;
  }
}
