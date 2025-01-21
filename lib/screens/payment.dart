import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakout_flutter_firebase/shared/components/button.dart';
import 'package:sneakout_flutter_firebase/shared/components/text_field.dart';
import 'package:sneakout_flutter_firebase/shared/layout/layout.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/colors.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/size.dart';
import 'package:sneakout_flutter_firebase/shared/utils/path/path.dart';
import 'package:sneakout_flutter_firebase/shared/utils/routes/route_name.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
            onPressed: onConfirm,
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
        padding: EdgeInsets.symmetric(horizontal: context.widthResponsive(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.widthResponsive(327),
              height: context.heightResponsive(91),
              margin: EdgeInsets.only(bottom: context.heightResponsive(22)),
              decoration: BoxDecoration(
                color: SNOColors.inputBackground,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('TOTAL',
                    style: TextStyle(
                      color: SNOColors.white,
                      fontSize: context.widthResponsive(14),
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  '฿ 6990',
                  style: TextStyle(
                    color: SNOColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: context.widthResponsive(16),
                  ),
                )
              ],
            ),
            Container(
              width: context.widthResponsive(60),
              margin: EdgeInsets.only(
                top: context.heightResponsive(25),
                bottom: context.heightResponsive(15),
              ),
              padding: EdgeInsets.only(
                bottom: context.heightResponsive(5),
                left: context.widthResponsive(1),
                right: context.widthResponsive(7),
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: SNOColors.white, width: 1),
                ),
              ),
              child: Text(
                'Methods',
                style: TextStyle(
                  color: SNOColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: context.widthResponsive(14),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: context.widthResponsive(70),
                  height: context.heightResponsive(35),
                  decoration: BoxDecoration(
                    color: SNOColors.inputBackground,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      SvgPaths.paypal,
                      width: context.widthResponsive(20),
                      height: context.widthResponsive(20),
                    ),
                  ),
                ),
                Container(
                  width: context.widthResponsive(70),
                  height: context.heightResponsive(35),
                  decoration: BoxDecoration(
                    color: SNOColors.inputBackground,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      SvgPaths.master_card,
                      width: context.widthResponsive(40),
                      height: context.widthResponsive(28),
                    ),
                  ),
                ),
                Container(
                  width: context.widthResponsive(70),
                  height: context.heightResponsive(35),
                  decoration: BoxDecoration(
                    color: SNOColors.inputBackground,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      SvgPaths.visa,
                      width: context.widthResponsive(37),
                      height: context.widthResponsive(26),
                    ),
                  ),
                ),
                Container(
                  width: context.widthResponsive(70),
                  height: context.heightResponsive(35),
                  decoration: BoxDecoration(
                    color: SNOColors.inputBackground,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      SvgPaths.cash,
                      width: context.widthResponsive(24),
                      height: context.widthResponsive(14),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  top: context.heightResponsive(22),
                  bottom: context.heightResponsive(13)),
              child: SNOTextField(
                hint: "Holder's Name",
                height: context.heightResponsive(35),
              ),
            ),
            SNOTextField(
              hint: "Card Number",
              height: context.heightResponsive(35),
            ),
            SizedBox(
              height: context.heightResponsive(13),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SNOTextField(
                  hint: "Expiry",
                  height: context.heightResponsive(35),
                  width: context.widthResponsive(165),
                ),
                SizedBox(
                  width: context.widthResponsive(10),
                ),
                SNOTextField(
                  hint: "CVV",
                  height: context.heightResponsive(35),
                  width: context.widthResponsive(110),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void onConfirm() {
    Navigator.of(context).pushNamed(SNORouteName.thankyou);
  }
}
