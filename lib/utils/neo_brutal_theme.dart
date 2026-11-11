import 'package:flutter/material.dart';

/// Neo-brutalism design tokens for Fley.
///
/// Visual rules: thick ink borders, flat fills, hard offset shadows
/// (no blur), bold saturated accents, and firm rounded corners.
class NeoBrutal {
  NeoBrutal._();

  static const double borderWidth = 3;
  static const double shadowOffset = 4;
  static const double radius = 12;
  static const double radiusSmall = 8;

  // Bold, flat palette used for highlights and tags.
  static const Color yellow = Color(0xFFFFE14D);
  static const Color pink = Color(0xFFFF8FC7);
  static const Color blue = Color(0xFF7CC8FF);
  static const Color green = Color(0xFF7CFF9E);
  static const Color orange = Color(0xFFFFA94D);

  static const Color _ink = Color(0xFF000000);
  static const Color _paperLight = Color(0xFFFFF6E0);
  static const Color _cardLight = Color(0xFFFFFFFF);
  static const Color _paperDark = Color(0xFF121212);
  static const Color _cardDark = Color(0xFF1E1E1E);

  /// Outline and text colour. Black on light, off-white on dark.
  static Color ink(bool isLight) => isLight ? _ink : const Color(0xFFF5F0E1);

  /// Shadow colour. Black on light, yellow on dark so it still reads.
  static Color shadow(bool isLight) => isLight ? _ink : yellow;

  static Color paper(bool isLight) => isLight ? _paperLight : _paperDark;

  static Color card(bool isLight) => isLight ? _cardLight : _cardDark;

  /// Hard, non-blurred offset shadow.
  static List<BoxShadow> hardShadow(bool isLight, {double? offset}) {
    final o = offset ?? shadowOffset;
    return [
      BoxShadow(
        color: shadow(isLight),
        offset: Offset(o, o),
        blurRadius: 0,
        spreadRadius: 0,
      ),
    ];
  }

  /// Standard neo box: fill, thick border, hard shadow.
  static BoxDecoration box({
    required bool isLight,
    Color? color,
    double borderRadius = radius,
    bool withShadow = true,
    double borderWidthOverride = borderWidth,
  }) {
    return BoxDecoration(
      color: color ?? card(isLight),
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: ink(isLight),
        width: borderWidthOverride,
      ),
      boxShadow: withShadow ? hardShadow(isLight) : null,
    );
  }

  /// Border-only decoration without shadow, used for inner dividers.
  static BorderSide side(bool isLight, {double width = borderWidth}) {
    return BorderSide(color: ink(isLight), width: width);
  }

  /// Shape shared by cards, dialogs and sheets.
  static RoundedRectangleBorder shape(
    bool isLight, {
    double borderRadius = radius,
  }) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: side(isLight),
    );
  }
}
