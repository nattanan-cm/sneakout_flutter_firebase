import 'package:flutter/material.dart';
import 'package:sneakout_flutter_firebase/shared/components/text_field.dart';
import 'package:sneakout_flutter_firebase/shared/layout/layout.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/size.dart';
import 'package:sneakout_flutter_firebase/shared/utils/path/path.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SNOLayout(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: context.heightResponsive(26),
            bottom: context.widthResponsive(60),
          ),
          child: SNOIcon.logoLarge,
        ),
        SNOIcon.iconSneaker,
        Padding(
          padding: EdgeInsets.only(
              top: context.heightResponsive(70),
              bottom: context.heightResponsive(55)),
          child: Column(
            children: [
              SNOTextField(
                prefixIcon: SNOIcon.email,
              ),
              SizedBox(
                height: context.heightResponsive(19),
              ),
              SNOTextField(),
            ],
          ),
        )
      ],
    ));
  }
}
