import 'package:flutter/material.dart';

class OmegaFormField extends StatefulWidget {
  final TextStyle? style;
  final String? Function(String?)? validator;
  final MaterialStateColor? textColor;
  final InputDecoration? decoration;
  const OmegaFormField({
    super.key,
    this.style,
    this.validator,
    this.decoration,
    this.textColor,
  });

  @override
  State<OmegaFormField> createState() => _OmegaFormFieldState();
}

class _OmegaFormFieldState extends State<OmegaFormField>
    with MaterialStateMixin<OmegaFormField> {
  bool fieldValid = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: widget.style?.copyWith(
        color: widget.textColor?.resolve(materialStates),
      ),
      decoration: widget.decoration,
      validator: (value) {
        var result = widget.validator?.call(value);
        if (result != null) {
          updateMaterialState(MaterialState.error,
              onChanged: (value) => setState(() {}));
        }
        return result;
      },
    );
  }
}
