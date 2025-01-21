import 'package:flutter/material.dart';
import 'package:sneakout_flutter_firebase/shared/components/button.dart';
import 'package:sneakout_flutter_firebase/shared/layout/layout.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/colors.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/size.dart';
import 'package:sneakout_flutter_firebase/shared/utils/routes/route_name.dart';

class ThankyouPage extends StatelessWidget {
  const ThankyouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SNOLayout(
      showLogo: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(bottom: context.heightResponsive(75)),
          child: SNOButton(
            width: context.widthResponsive(279),
            height: context.heightResponsive(55),
            onPressed: () => onContinue(context),
            child: Text(
              'CONFIRM PAYMENT',
              style: TextStyle(
                color: SNOColors.black,
                fontSize: context.widthResponsive(16),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
      body: Container(
        margin: EdgeInsets.only(top: context.heightResponsive(50)),
        child: Column(
          children: [
            Text(
              'Thanks',
              style: TextStyle(
                color: SNOColors.springGreen,
                fontSize: context.widthResponsive(32),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'For shopping with us',
              style: TextStyle(
                color: SNOColors.white,
                fontSize: context.widthResponsive(24),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: context.heightResponsive(44),
            ),
            Container(
              height: context.widthResponsive(300),
              width: context.widthResponsive(300),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onContinue(context) {
    Navigator.of(context).pushReplacementNamed(SNORouteName.home);
  }
}
