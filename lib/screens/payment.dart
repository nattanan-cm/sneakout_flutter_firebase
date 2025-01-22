import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakout_flutter_firebase/constants/enum/payment_method.dart';
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
  PaymentEnum? currMethod;

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
            itemCard(
              label: "Air Jordan 1 High OG",
              price: "6990",
              size: "10",
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
            ...buildMethods(method: currMethod),
            ...buildCardMethodForm(
              holdername: TextEditingController(),
              cardNumber: TextEditingController(),
              expiry: TextEditingController(),
              cvv: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildMethods({PaymentEnum? method}) {
    return [
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
          GestureDetector(
            onTap: () => changeMethod(PaymentEnum.paypal),
            child: Container(
              width: context.widthResponsive(70),
              height: context.heightResponsive(35),
              decoration: BoxDecoration(
                color: SNOColors.inputBackground,
                borderRadius: BorderRadius.circular(5),
                border: method == PaymentEnum.paypal
                    ? Border.all(color: SNOColors.springGreen, width: 1)
                    : null,
              ),
              child: Center(
                child: SvgPicture.asset(
                  SvgPaths.paypal,
                  width: context.widthResponsive(20),
                  height: context.widthResponsive(20),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => changeMethod(PaymentEnum.mastercard),
            child: Container(
              width: context.widthResponsive(70),
              height: context.heightResponsive(35),
              decoration: BoxDecoration(
                color: SNOColors.inputBackground,
                borderRadius: BorderRadius.circular(5),
                border: method == PaymentEnum.mastercard
                    ? Border.all(color: SNOColors.springGreen, width: 1)
                    : null,
              ),
              child: Center(
                child: SvgPicture.asset(
                  SvgPaths.master_card,
                  width: context.widthResponsive(40),
                  height: context.widthResponsive(28),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => changeMethod(PaymentEnum.visa),
            child: Container(
              width: context.widthResponsive(70),
              height: context.heightResponsive(35),
              decoration: BoxDecoration(
                color: SNOColors.inputBackground,
                borderRadius: BorderRadius.circular(5),
                border: method == PaymentEnum.visa
                    ? Border.all(color: SNOColors.springGreen, width: 1)
                    : null,
              ),
              child: Center(
                child: SvgPicture.asset(
                  SvgPaths.visa,
                  width: context.widthResponsive(37),
                  height: context.widthResponsive(26),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => changeMethod(PaymentEnum.transfer),
            child: Container(
              width: context.widthResponsive(70),
              height: context.heightResponsive(35),
              decoration: BoxDecoration(
                color: SNOColors.inputBackground,
                borderRadius: BorderRadius.circular(5),
                border: method == PaymentEnum.transfer
                    ? Border.all(color: SNOColors.springGreen, width: 1)
                    : null,
              ),
              child: Center(
                child: SvgPicture.asset(
                  SvgPaths.cash,
                  width: context.widthResponsive(24),
                  height: context.widthResponsive(14),
                ),
              ),
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> buildCardMethodForm({
    required TextEditingController holdername,
    required TextEditingController cardNumber,
    required TextEditingController expiry,
    required TextEditingController cvv,
  }) {
    return [
      Container(
        margin: EdgeInsets.only(
            top: context.heightResponsive(22),
            bottom: context.heightResponsive(13)),
        child: SNOTextField(
          hint: "Holder's Name",
          controller: holdername,
          height: context.heightResponsive(35),
        ),
      ),
      SNOTextField(
        hint: "Card Number",
        controller: cardNumber,
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
            controller: expiry,
            height: context.heightResponsive(35),
            width: context.widthResponsive(165),
          ),
          SizedBox(
            width: context.widthResponsive(10),
          ),
          SNOTextField(
            hint: "CVV",
            controller: cvv,
            height: context.heightResponsive(35),
            width: context.widthResponsive(110),
          ),
        ],
      )
    ];
  }

  Container itemCard(
      {required String label, required String price, required String size}) {
    return Container(
      width: context.widthResponsive(327),
      height: context.heightResponsive(91),
      margin: EdgeInsets.only(bottom: context.heightResponsive(22)),
      padding: EdgeInsets.symmetric(
          vertical: context.heightResponsive(10),
          horizontal: context.widthResponsive(15)),
      decoration: BoxDecoration(
        color: SNOColors.inputBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border(
          bottom: BorderSide(
              color: const Color(0xFF00FFC2).withValues(alpha: 0.66), width: 2),
          right: BorderSide(
              color: const Color(0xFF00FFC2).withValues(alpha: 0.66), width: 2),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              ImagePaths.avatar,
              width: context.widthResponsive(71),
              height: context.widthResponsive(71),
            ),
          ),
          SizedBox(
            width: context.widthResponsive(11),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.widthResponsive(200),
                child: Text(
                  "$label ( US $size )",
                  style: TextStyle(
                    color: SNOColors.white,
                    fontSize: context.widthResponsive(13),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                "฿ $price",
                style: TextStyle(
                  color: SNOColors.deepGreen,
                  fontSize: context.widthResponsive(15),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void changeMethod(PaymentEnum method) {
    currMethod = method;
    setState(() {});
  }

  void onConfirm() {
    Navigator.of(context).pushNamed(SNORouteName.thankyou);
  }
}
