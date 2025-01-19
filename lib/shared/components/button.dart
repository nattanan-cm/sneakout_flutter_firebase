import 'package:flutter/material.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/colors.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/size.dart';

class SNOButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Widget child;
  final Gradient? gradient;

  const SNOButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    double defaultWidth = width ?? context.widthResponsive(279);
    double defaultHeight = height ?? context.heightResponsive(63);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: context.widthResponsive(defaultWidth),
          height: context.heightResponsive(defaultHeight),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: context.widthResponsive(15),
          ),
          decoration: BoxDecoration(
            gradient: gradient ??
                const LinearGradient(colors: [
                  SNOColors.cyan,
                  SNOColors.springGreen,
                ]),
            color: SNOColors.inputBackground,
            borderRadius: BorderRadius.circular(30),
          ),
          child: child),
    );
  }
}
