import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

extension TextStyleX on TextStyle {
  /// A method to underline a text with a customizable [distance] between the text
  /// and underline. The [color], [thickness] and [style] can be set
  /// as the decorations of a [TextStyle].
  TextStyle underlined({
    Color? color,
    double distance = 1,
    double thickness = 1,
    TextDecorationStyle style = TextDecorationStyle.solid,
  }) {
    return copyWith(
      shadows: [
        Shadow(
          color: this.color ?? Colors.black,
          offset: Offset(0, -distance),
        )
      ],
      color: Colors.transparent,
      decoration: TextDecoration.underline,
      decorationThickness: thickness,
      decorationColor: color ?? this.color,
      decorationStyle: style,
    );
  }
}

class LinkTextStyle extends ThemeExtension<LinkTextStyle> {
  MaterialStateTextStyle materialStyle;
  LinkTextStyle({
    required this.materialStyle,
  });

  @override
  ThemeExtension<LinkTextStyle> copyWith() {
    return this;
  }

  @override
  ThemeExtension<LinkTextStyle> lerp(
      covariant ThemeExtension<LinkTextStyle>? other, double t) {
    return this;
  }
}

abstract class Theming {
  static LinkTextStyle defaulteLinkStyle = LinkTextStyle(
    materialStyle: MaterialStateTextStyle.resolveWith((states) {
      return GoogleFonts.rubik(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.03,
        color: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.textP;
          }
          if (states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.focused)) {
            return AppColors.linkHover;
          }
          return AppColors.link;
        }).resolve(states),
      );
    }),
  );
}
