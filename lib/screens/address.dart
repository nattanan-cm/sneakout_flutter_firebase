import 'package:flutter/material.dart';
import 'package:sneakout_flutter_firebase/shared/components/button.dart';
import 'package:sneakout_flutter_firebase/shared/components/text_field.dart';
import 'package:sneakout_flutter_firebase/shared/layout/layout.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/colors.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/size.dart';
import 'package:sneakout_flutter_firebase/shared/utils/routes/route_name.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
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
              'CONFIRM',
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
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SNOTextField(
              hint: 'Building',
              height: context.heightResponsive(35),
            ),
            SizedBox(
              height: context.heightResponsive(13),
            ),
            SNOTextField(
              hint: 'Address',
              height: context.heightResponsive(35),
            ),
            SizedBox(
              height: context.heightResponsive(13),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SNOTextField(
                  hint: 'City',
                  height: context.heightResponsive(35),
                  width: context.widthResponsive(135),
                ),
                SNOTextField(
                  hint: 'Province',
                  height: context.heightResponsive(35),
                  width: context.widthResponsive(160),
                ),
              ],
            ),
            SizedBox(
              height: context.heightResponsive(13),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SNOTextField(
                  hint: 'Country',
                  height: context.heightResponsive(35),
                  width: context.widthResponsive(170),
                ),
                SNOTextField(
                  hint: 'Postal Code',
                  height: context.heightResponsive(35),
                  width: context.widthResponsive(125),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onConfirm() {
    // add id to provider

    // if address is not provided nav to address page

    // else nav to payment page
    Navigator.of(context).pushNamed(SNORouteName.payment);
  }
}
