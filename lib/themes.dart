import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class LinkTextStyle extends ThemeExtension<LinkTextStyle> {
  MaterialStateTextStyle textStyle;
  LinkTextStyle({
    required this.textStyle,
  });

  @override
  LinkTextStyle copyWith({MaterialStateTextStyle? textStyle}) {
    return LinkTextStyle(
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  ThemeExtension<LinkTextStyle> lerp(
      covariant ThemeExtension<LinkTextStyle>? other, double t) {
    return this;
  }
}

abstract class Theming {
  static ElevatedButtonThemeData footerElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith((states) {
        return Colors.white;
      }),
      foregroundColor: MaterialStateColor.resolveWith((states) {
        return AppColors.textH;
      }),
      shadowColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
      textStyle: MaterialStatePropertyAll(GoogleFonts.rubik(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.48,
      )),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(
          vertical: 13,
          horizontal: 9,
        ),
      ),
      minimumSize: const MaterialStatePropertyAll<Size>(Size(42, 42)),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      visualDensity: VisualDensity.standard,
    ),
  );

  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return const Color.fromARGB(255, 240, 238, 255);
        }
        if (states.contains(MaterialState.hovered)) {
          return const Color.fromARGB(255, 134, 27, 192);
        }
        if (states.contains(MaterialState.pressed)) {
          return const Color.fromARGB(255, 160, 74, 207);
        }
        return const Color.fromARGB(255, 160, 74, 207);
      }),
      foregroundColor: MaterialStateColor.resolveWith((states) {
        return states.contains(MaterialState.disabled)
            ? AppColors.violetHard
            : Colors.white;
      }),
      shadowColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
      textStyle: MaterialStatePropertyAll(GoogleFonts.rubik(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.03,
      )),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(
          vertical: 13,
          horizontal: 35,
        ),
      ),
      minimumSize: const MaterialStatePropertyAll<Size>(Size(50, 50)),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      visualDensity: VisualDensity.standard,
    ),
  );

  static LinkTextStyle defaultLinkStyle = LinkTextStyle(
    textStyle: MaterialStateTextStyle.resolveWith((states) {
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

  static LinkTextStyle defaultHeaderLinkStyle = LinkTextStyle(
    textStyle: MaterialStateTextStyle.resolveWith((states) {
      return GoogleFonts.rubik(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.02,
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

  static PageBarItemStyle defaultMainButtonStyle =
      PageBarItemStyle(textStyle: MaterialStateTextStyle.resolveWith((states) {
    return GoogleFonts.rubik(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: (states.contains(MaterialState.hovered))
          ? AppColors.mainButton
          : AppColors.textH,
    );
  }), border: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) {
      return const Border(
        bottom: BorderSide(
          color: AppColors.mainButton,
          width: 2.0,
        ),
      );
    }
    return const Border.fromBorderSide(BorderSide.none);
  }));

  static OmegaIconButtonTheme defaultOmegaIconButtonTheme =
      OmegaIconButtonTheme(
    labelStyle: MaterialStateTextStyle.resolveWith((states) {
      return GoogleFonts.rubik(
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
        color: AppColors.textH,
      );
    }),
  );
}

class PageBarItemStyle extends ThemeExtension<PageBarItemStyle> {
  final MaterialStateTextStyle textStyle;
  final MaterialStateProperty<Border> border;

  PageBarItemStyle({
    required this.textStyle,
    required this.border,
  });

  @override
  ThemeExtension<PageBarItemStyle> copyWith({
    MaterialStateTextStyle? textStyle,
    MaterialStateProperty<Border>? border,
  }) {
    return PageBarItemStyle(
      textStyle: textStyle ?? this.textStyle,
      border: border ?? this.border,
    );
  }

  @override
  ThemeExtension<PageBarItemStyle> lerp(
      covariant ThemeExtension<PageBarItemStyle>? other, double t) {
    return this;
  }
}

class OmegaIconButtonTheme extends ThemeExtension<OmegaIconButtonTheme> {
  final MaterialStateTextStyle labelStyle;

  OmegaIconButtonTheme({
    required this.labelStyle,
  });

  @override
  ThemeExtension<OmegaIconButtonTheme> copyWith() {
    return this;
  }

  @override
  ThemeExtension<OmegaIconButtonTheme> lerp(
      covariant ThemeExtension<OmegaIconButtonTheme>? other, double t) {
    return this;
  }
}
