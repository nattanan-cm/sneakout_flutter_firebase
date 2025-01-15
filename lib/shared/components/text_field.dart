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
    this.showCursor = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthResponsive(width),
      height: context.heightResponsive(height),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: context.widthResponsive(18),
      ),
      decoration: BoxDecoration(
        color: SNOColors.inputBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        showCursor: showCursor,
        textAlign: TextAlign.start,
        textAlignVertical: onChangedObscure != null
            ? (obscureText && controller?.value.text == ''
                ? TextAlignVertical.bottom
                : TextAlignVertical.center)
            : null,
        cursorColor: SNOColors.springGreen,
        style: TextStyle(
          color: SNOColors.white,
          fontSize: context.widthResponsive(14),
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: SNOColors.white.withOpacity(0.4),
            fontSize: context.widthResponsive(12),
          ),
          icon: SizedBox(
            width: context.widthResponsive(25),
            child: Center(child: prefixIcon),
          ),
          border: InputBorder.none,
          suffixIcon: onChangedObscure != null
              ? GestureDetector(
                  child: Icon(
                    color: SNOColors.white,
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onTap: () => onChangedObscure!(!obscureText),
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
