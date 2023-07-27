import 'package:flutter/material.dart';
import 'package:omega_app/constants.dart';

class OmegaFormField extends StatefulWidget {
  final TextStyle? style;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final MaterialStateColor? textColor;
  final Widget? label;
  final bool obscureText;

  final void Function(String?)? onChanged;

  final InputDecoration? decoration;
  const OmegaFormField({
    super.key,
    this.style,
    this.validator,
    this.decoration,
    this.textColor,
    this.controller,
    this.onChanged,
    this.label,
    this.obscureText = false,
  });

  static final MaterialStateColor _defaultTextColor =
      MaterialStateColor.resolveWith((states) {
    if (states.contains(MaterialState.hovered)) {
      return AppColors.textP;
    }
    if (states.contains(MaterialState.error)) {
      return AppColors.textLight;
    }
    return AppColors.textP;
  });

  @override
  State<OmegaFormField> createState() => _OmegaFormFieldState();
}

class _OmegaFormFieldState extends State<OmegaFormField>
    with MaterialStateMixin<OmegaFormField>, ChangeNotifier {
  bool fieldValid = true;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onFocusChange: updateMaterialState(MaterialState.hovered),
      onHover: updateMaterialState(MaterialState.hovered),
      child: TextFormField(
        obscureText: widget.obscureText,
        style:
            (widget.style ?? Theme.of(context).textTheme.titleMedium!).copyWith(
          color: (widget.textColor ?? OmegaFormField._defaultTextColor)
              .resolve(materialStates),
        ),
        onChanged: (value) {
          setMaterialState(MaterialState.error, false);
          widget.onChanged?.call(value);
        },
        decoration: (widget.decoration ?? InputDecoration()).copyWith(
          label: widget.label,
          suffixIcon: (isErrored)
              ? const Icon(
                  Icons.info_outline_rounded,
                  color: Colors.red,
                )
              : null,
        ),
        controller: controller,
        validator: (value) {
          var result = widget.validator?.call(value);
          setMaterialState(MaterialState.error, result != null);
          return result;
        },
      ),
    );
  }
}
