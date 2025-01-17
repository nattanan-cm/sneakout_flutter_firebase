import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/colors.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/size.dart';
import 'package:sneakout_flutter_firebase/shared/utils/path/path.dart';

import '../components/state.dart';

class SNOLayout extends StatelessWidget {
  final void Function()? onBack;
  final void Function()? onAvatar;
  final bool showAvatar;
  final bool showLogo;
  final bool isLoading;
  final Widget body;
  final List<Widget>? actions;
  const SNOLayout({
    super.key,
    this.onBack,
    this.onAvatar,
    this.showAvatar = false,
    this.showLogo = false,
    this.isLoading = false,
    required this.body,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return StateLoading(
      isLoading: isLoading,
      child: Scaffold(
        appBar: showLogo
            ? PreferredSize(
                preferredSize: context.headerSize,
                child: Padding(
                  padding: EdgeInsets.only(top: context.heightResponsive(20)),
                  child: Stack(children: [
                    Positioned(
                      right: 1,
                      left: 1,
                      top: 6,
                      child: SvgPicture.asset(
                        SvgPaths.logo,
                        width: context.widthResponsive(124),
                        height: context.heightResponsive(28),
                      ),
                    ),
                    if (showAvatar)
                      Positioned(
                        right: 20,
                        top: 1,
                        child: GestureDetector(
                          onTap: onAvatar,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                context.widthResponsive(40) / 2),
                            child: Image.asset(
                              ImagePaths.avatar,
                              width: context.widthResponsive(40),
                              height: context.widthResponsive(40),
                            ),
                          ),
                        ),
                      ),
                  ]),
                ),
              )
            : null,
        backgroundColor: SNOColors.background,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(
            top: !(showLogo || showAvatar) ? context.heightResponsive(20) : 0.0,
            bottom: context.heightResponsive(50),
            left: context.widthResponsive(30),
            right: context.widthResponsive(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: body),
              if (actions != null) ...actions!,
            ],
          ),
        ),
      ),
    );
  }
}
