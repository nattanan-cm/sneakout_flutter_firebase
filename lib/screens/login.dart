import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakout_flutter_firebase/shared/components/button.dart';
import 'package:sneakout_flutter_firebase/shared/components/text_field.dart';
import 'package:sneakout_flutter_firebase/shared/layout/layout.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/size.dart';
import 'package:sneakout_flutter_firebase/shared/utils/path/path.dart';

import '../shared/utils/extensions/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SNOLayout(
        body: Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: context.heightResponsive(26),
                  bottom: context.widthResponsive(60),
                ),
                child: SvgPicture.asset(
                  SvgPaths.logoLarge,
                ),
              ),
              Image.asset(
                ImagePaths.iconSneaker,
                width: context.widthResponsive(190),
                height: context.heightResponsive(124),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: context.heightResponsive(70),
                    bottom: context.heightResponsive(55)),
                child: Column(
                  children: [
                    SNOTextField(
                      prefixIcon: SvgPicture.asset(
                        SvgPaths.email,
                        width: context.widthResponsive(21),
                        height: context.heightResponsive(17),
                      ),
                      hint: "EMAIL",
                    ),
                    SizedBox(
                      height: context.heightResponsive(19),
                    ),
                    SNOTextField(
                      prefixIcon: SvgPicture.asset(
                        SvgPaths.lock,
                        width: context.widthResponsive(16),
                        height: context.heightResponsive(21),
                      ),
                      hint: "PASSWORD",
                      obscureText: obscureText,
                      onChangedObscure: (value) {
                        obscureText = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: context.heightResponsive(50),
                    bottom: context.heightResponsive(18)),
                child: SNOButton(
                  text: 'Test',
                  onPressed: onLogin,
                  child: Text(
                    'LOG IN',
                    style: TextStyle(
                        color: SNOColors.black,
                        fontSize: context.widthResponsive(16),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Text(
                'Forgot Password?',
                style: TextStyle(
                    color: const Color(0xFF06F3E5),
                    fontSize: context.widthResponsive(15)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(
                  color: SNOColors.white.withOpacity(0.4),
                  fontSize: context.widthResponsive(15),
                ),
              ),
              GestureDetector(
                onTap: onSignUp,
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: const Color(0xFF00FF85),
                    fontSize: context.widthResponsive(15),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }

  void onSignUp() {}

  void onLogin() {}
}
