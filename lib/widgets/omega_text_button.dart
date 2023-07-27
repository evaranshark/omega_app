import 'package:flutter/material.dart';

class OmegaTextButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const OmegaTextButton._({
    super.key,
    required this.underlined,
    this.onPressed,
    required this.child,
  });

  factory OmegaTextButton({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
  }) =>
      OmegaTextButton._(
        key: key,
        underlined: false,
        onPressed: onPressed,
        child: child,
      );

  factory OmegaTextButton.underlined({
    Key? key,
    required VoidCallback onPressed,
    required Widget child,
  }) {
    return OmegaTextButton._(
      key: key,
      underlined: true,
      onPressed: onPressed,
      child: child,
    );
  }

  final bool underlined;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              decoration: underlined ? TextDecoration.underline : null,
            ),
      ),
      child: child,
    );
  }
}
