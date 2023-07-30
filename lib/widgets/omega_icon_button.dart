import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../themes.dart';

/// Uses [OmegaIconButtonTheme] extension for styling.
///
/// Icon priority:
/// 1. [iconWidget]
/// 2. [svgAsset]
/// 3. [icon]

// TODO: Provide styles for svgAsset and icon
class OmegaIconButton extends StatelessWidget {
  final Widget? iconWidget;
  final IconData? icon;
  final String? svgAsset;

  final String? label;

  /// Style used for label
  final TextStyle? style;
  const OmegaIconButton({
    super.key,
    this.iconWidget,
    this.label,
    this.style,
    this.icon,
    this.svgAsset,
  }) : assert(iconWidget == null && icon == null && svgAsset == null,
            "Either icon, iconWidget or svgAsset must be provided.");

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(7.5),
          child: (label == null)
              ? iconWidget
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Builder(
                      builder: (context) {
                        if (iconWidget != null) {
                          return iconWidget!;
                        }
                        if (svgAsset != null) {
                          return SvgPicture.asset(
                            svgAsset!,
                          );
                        }
                        return Icon(icon!);
                      },
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      label!,
                      style: style ??
                          Theme.of(context)
                              .extension<OmegaIconButtonTheme>()!
                              .labelStyle,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
