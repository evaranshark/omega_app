import 'package:flutter/material.dart';

import '../themes.dart';

class LinkText extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  const LinkText({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> with MaterialStateMixin {
  @override
  Widget build(BuildContext context) {
    setMaterialState(MaterialState.disabled, widget.onPressed == null);
    return InkWell(
      onTap: widget.onPressed,
      onHover: updateMaterialState(MaterialState.hovered),
      child: Text(
        widget.text,
        style: Theme.of(context)
            .extension<LinkTextStyle>()!
            .textStyle
            .resolve(materialStates),
        // style: Theme.of(context).extension<LinkTextStyle>()!.style.copyWith(
        //     color: Theme.of(context)
        //         .extension<LinkTextStyle>()!
        //         .color
        //         .resolve(materialStates)),
      ),
    );
  }
}
