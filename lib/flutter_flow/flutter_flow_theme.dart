// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color primaryBtnText;
  late Color lineColor;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFF000000);
  late Color secondaryColor = const Color(0xFFEED307);
  late Color tertiaryColor = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFFF5963);
  late Color primaryBackground = const Color(0xFFF1F4F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFF101213);
  late Color secondaryText = const Color(0xFF57636C);

  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFFE0E3E7);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Montserrat';
  TextStyle get title1 => GoogleFonts.getFont(
        'Montserrat',
        color: theme.primaryText,
        fontWeight: FontWeight.w900,
        fontSize: 24,
      );
  String get title2Family => 'Montserrat';
  TextStyle get title2 => GoogleFonts.getFont(
        'Montserrat',
        color: theme.secondaryText,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      );
  String get title3Family => 'Montserrat';
  TextStyle get title3 => GoogleFonts.getFont(
        'Montserrat',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20,
      );
  String get subtitle1Family => 'Montserrat';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Montserrat',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      );
  String get subtitle2Family => 'Montserrat';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Montserrat',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get bodyText1Family => 'Montserrat';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Montserrat',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  String get bodyText2Family => 'Montserrat';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Montserrat',
        color: theme.secondaryText,
        fontWeight: FontWeight.w200,
        fontSize: 14,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
