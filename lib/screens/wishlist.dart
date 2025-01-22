import 'package:flutter/material.dart';
import 'package:sneakout_flutter_firebase/shared/components/button.dart';
import 'package:sneakout_flutter_firebase/shared/components/text_field.dart';
import 'package:sneakout_flutter_firebase/shared/layout/layout.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/colors.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/size.dart';
import 'package:sneakout_flutter_firebase/shared/utils/path/path.dart';
import 'package:sneakout_flutter_firebase/shared/utils/routes/route_name.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<Map<String, dynamic>> data = [
    {
      "label": "Air Jordan 1 High OG",
      "price": '6999',
      "size": '10',
    },
    {
      "label": "Air Jordan 1 High OG",
      "price": '6999',
      "size": '10',
    },
    {
      "label": "Air Jordan 1 High OG",
      "price": '6999',
      "size": '10',
    },
    {
      "label": "Air Jordan 1 High OG",
      "price": '6999',
      "size": '10',
    },
    {
      "label": "Air Jordan 1 High OG",
      "price": '6999',
      "size": '10',
    },
    {
      "label": "Air Jordan 1 High OG",
      "price": '6999',
      "size": '10',
    },
    {
      "label": "Air Jordan 1 High OG",
      "price": '6999',
      "size": '10',
    },
    {
      "label": "Air Jordan 1 High OG",
      "price": '6999',
      "size": '10',
    },
    {
      "label": "Air Jordan 1 High OG",
      "price": '6999',
      "size": '10',
    },
    {
      "label": "Air Jordan 1 High OG",
      "price": '6999',
      "size": '10',
    },
    {
      "label": "Air Jordan 1 High OG",
      "price": '6999',
      "size": '10',
    },
    {
      "label": "Air Jordan 1 High OG",
      "price": '6999',
      "size": '10',
    },
    {
      "label": "Air Jordan 1 High OG",
      "price": '6999',
      "size": '10',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SNOLayout(
      showLogo: true,
      body: Container(
        margin: EdgeInsets.only(top: context.heightResponsive(30)),
        padding: EdgeInsets.symmetric(horizontal: context.widthResponsive(20)),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: data.map((e) {
              int idx = data.indexOf(e);
              return Padding(
                padding: EdgeInsets.only(
                  bottom: idx != (data.length - 1)
                      ? context.heightResponsive(8)
                      : 0.0,
                ),
                child: GestureDetector(
                  onTap: () => {},
                  child: wishlistCard(
                      label: e['label'], price: e['price'], size: e['size']),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  SizedBox wishlistCard({
    required String label,
    required String price,
    required String size,
  }) {
    return SizedBox(
      width: context.widthResponsive(320),
      height: context.heightResponsive(90),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Image.asset(
              ImagePaths.avatar,
              width: context.heightResponsive(90),
              height: context.heightResponsive(90),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(
              vertical: context.heightResponsive(8),
              horizontal: context.heightResponsive(10),
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Color(0xFFD9D9D9),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$label (US $size)',
                  style: TextStyle(
                    color: SNOColors.black,
                    fontSize: context.widthResponsive(12),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '฿ $price',
                  style: TextStyle(
                    color: SNOColors.deepGreen,
                    fontSize: context.widthResponsive(12),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SNOButton(
                    width: context.widthResponsive(70),
                    height: context.heightResponsive(25),
                    onPressed: () {},
                    child: Text(
                      "BUY NOW",
                      style: TextStyle(
                        color: SNOColors.white,
                        fontSize: context.widthResponsive(10),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
        ],
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
