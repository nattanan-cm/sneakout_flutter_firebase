import 'package:flutter/material.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/colors.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/size.dart';

class SNOTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final String? hint;
  final String? errorMsg;
  final bool obscureText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(bool)? onChangedObscure;
  final double width;
  final double height;
  final bool showCursor;

  const SNOTextField({
    super.key,
    this.prefixIcon,
    this.hint,
    this.errorMsg,
    this.obscureText = false,
    this.controller,
    this.onChanged,
    this.onChangedObscure,
    this.width = 330,
    this.height = 53,
    this.showCursor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthResponsive(width),
      height: context.heightResponsive(height),
      padding: EdgeInsets.symmetric(
          horizontal: context.widthResponsive(18),
          vertical: context.heightResponsive(10)),
      decoration: BoxDecoration(
        color: SNOColors.inputBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        showCursor: showCursor,
        maxLines: null,
        minLines: null,
        style: const TextStyle(color: SNOColors.white, fontSize: 12),
        expands: true,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: prefixIcon,
          border: InputBorder.none,
          suffix: onChangedObscure != null
              ? GestureDetector(
                  child: Icon(
                    obscureText == true
                        ? Icons.visibility_off
                        : Icons.visibility_rounded,
                  ),
                )
              : null,
        ),
        onChanged: onChanged,
        obscureText: obscureText,
        obscuringCharacter: '*',
      ),
    );
  }
}
