/// A utility class for validating form input fields using predefined rules.
class Validator {
  /// Returns a validator that checks whether a field is not empty.
  static String? Function(String?) required(
      [String message = 'This field is required']) {
    return (value) {
      if (value == null || value.trim().isEmpty) return message;
      return null;
    };
  }

  /// Returns a validator that checks whether a field is a valid email.
  static String? Function(String?) email(
      [String message = 'Enter a valid email']) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(value)) return message;
      return null;
    };
  }

  /// Returns a validator that checks whether a field has a minimum length.
  static String? Function(String?) minLength(int min, [String? message]) {
    return (value) {
      if (value == null || value.length < min) {
        return message ?? 'Minimum $min characters required';
      }
      return null;
    };
  }

  /// Returns a validator that checks whether a field has a maximum length.
  static String? Function(String?) maxLength(int max, [String? message]) {
    return (value) {
      if (value != null && value.length > max) {
        return message ?? 'Maximum $max characters allowed';
      }
      return null;
    };
  }

  /// Returns a validator that checks whether a field matches another field's value.
  static String? Function(String?) match(String valueToMatch,
      [String? message]) {
    return (value) {
      if (value != valueToMatch) return message ?? 'Values do not match';
      return null;
    };
  }

  /// Combines multiple validators into a single validator.
  static String? Function(String?) combine(
      List<String? Function(String?)> validators) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }
}
