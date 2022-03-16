import 'package:flutter/material.dart';

class ThemeConfig {
  static const Color _primary = Color(0xFF007EA7);
  static const Color _white = Color(0xFFFFFFFF);
  static const Color _black = Color(0xFF292929);
  static const Color _background = Color(0xFFF8F8FA);

  static ThemeData get themeData => ThemeData(
        backgroundColor: _background,
        scaffoldBackgroundColor: _background,
        colorScheme: _colorScheme,
        textTheme: _TextThemeData.data,
        cardColor: _colorScheme.surface,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all<Color>(_colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        iconTheme: IconThemeData(
          color: _colorScheme.text,
        ),
      );

  static const ColorScheme _colorScheme = ColorScheme(
    primary: _primary,
    primaryContainer: _white,
    secondary: Color(0xFFD61515),
    secondaryContainer: _white,
    surface: _white,
    background: _background,
    error: Color(0xFFF00505),
    onPrimary: _white,
    onSecondary: _white,
    onSurface: _black,
    onBackground: _white,
    onError: _white,
    brightness: Brightness.light,
  );
}

class _TextThemeData {
  static const TextTheme data = TextTheme(
    bodyText1: _body1Text,
    bodyText2: _body2Text,
    caption: _captionText,
    subtitle2: _subtitle2Text,
    subtitle1: _subtitle1Text,
    headline3: _headline3Text,
    overline: _overlineText,
  );

  static const TextStyle _headline3Text = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle _subtitle1Text = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle _subtitle2Text = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle _body1Text = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle _body2Text = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle _captionText = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle _overlineText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );
}

extension DidvanColorScheme on ColorScheme {
  // Secondary colors
  Color get secondaryDisabled => brightness == Brightness.dark
      ? const Color(0xFF703838)
      : const Color(0xFFFFC8C8);

  Color get white => const Color(0xFFFFFFFF);
  Color get focused => brightness == Brightness.dark
      ? const Color(0xFF20272E)
      : const Color(0xFFE6F3FA);
  Color get navigation => brightness == Brightness.dark
      ? const Color(0xFF181B1F)
      : const Color(0xFF012348);
  Color get focusedBorder => brightness == Brightness.dark
      ? const Color(0xFF9FB2C2)
      : const Color(0xFF195D80);
  Color get title => brightness == Brightness.dark
      ? const Color(0xFFD6D6D6)
      : const Color(0xFF1B3C59);
  Color get text => brightness == Brightness.dark
      ? const Color(0xFFD6D6D6)
      : const Color(0xFF292929);
  Color get inputText => brightness == Brightness.dark
      ? const Color(0xFFA3A3A3)
      : const Color(0xFF3D3D3D);
  Color get caption => brightness == Brightness.dark
      ? const Color(0xFFBBBBBB)
      : const Color(0xFF666666);
  Color get hint => brightness == Brightness.dark
      ? const Color(0xFF7A7A7A)
      : const Color(0xFFBBBBBB);
  Color get disabledText => brightness == Brightness.dark
      ? const Color(0xFF5C5C5C)
      : const Color(0xFFBBBBBB);
  Color get border => brightness == Brightness.dark
      ? const Color(0xFF5C5C5C)
      : const Color(0xFFE0E0E0);
  Color get cardBorder => brightness == Brightness.dark
      ? const Color(0xFF5C5C5C)
      : const Color(0xFFEBEBEB);
  Color get disabledBackground => brightness == Brightness.dark
      ? const Color(0xFF333333)
      : const Color(0xFFE0E0E0);
  Color get secondCTA => brightness == Brightness.dark
      ? const Color(0xFF474747)
      : const Color(0xFFF5F5F5);
  Color get splash => brightness == Brightness.dark
      ? const Color(0xFF333333)
      : const Color(0xFFC8E0F4);
  Color get black => brightness == Brightness.dark
      ? const Color(0xFF1F1F1F)
      : const Color(0xFF292929);
  Color get overlay => brightness == Brightness.dark
      ? const Color(0xFF0F1011)
      : const Color(0xFF292929);

  // Error and success colors
  Color get errorBack => brightness == Brightness.dark
      ? const Color(0xFF2B2325)
      : const Color(0xFFFFF8F8);
  Color get successBack => brightness == Brightness.dark
      ? const Color(0xFF2C332B)
      : const Color(0xFFF5FFFC);
  Color get success => brightness == Brightness.dark
      ? const Color(0xFF2FC250)
      : const Color(0xFF2BB24A);
}
