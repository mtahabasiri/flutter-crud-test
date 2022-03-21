class Validator {
  static String? lengthValidator({
    required String value,
    String? title,
    required int length,
  }) {
    if (value.length < length) {
      return title ?? 'Value' 'must be at least $length characters';
    }
    return null;
  }

  static String? emailValirator({required String value}) {
    final reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (reg.hasMatch(value)) {
      return null;
    }
    return 'Email isn\' valid';
  }
}
