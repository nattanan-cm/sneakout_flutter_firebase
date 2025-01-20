import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sneakout_flutter_firebase/shared/components/button.dart';
import 'package:sneakout_flutter_firebase/shared/layout/layout.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/colors.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/size.dart';
import 'package:sneakout_flutter_firebase/shared/utils/path/path.dart';
import 'package:sneakout_flutter_firebase/shared/utils/routes/route_name.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

bool wishlist = false;

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SNOLayout(
        showAvatar: true,
        showLogo: true,
        onAvatar: () => {},
        onBack: () => {},
        actions: [
          SNOButton(
              width: context.widthResponsive(80),
              height: context.heightResponsive(55),
              gradient: LinearGradient(colors: [
                const Color(0xFFFF0099).withValues(alpha: 0.7),
                const Color(0xFFFF3D00).withValues(alpha: 0.7),
              ]),
              onPressed: () {
                wishlist = !wishlist;
                addToWishlist();
                setState(() {});
              },
              child: SvgPicture.asset(
                wishlist ? SvgPaths.heart_filled : SvgPaths.heart,
                width: context.widthResponsive(27),
                height: context.widthResponsive(25),
              )),
          SNOButton(
            width: context.widthResponsive(216),
            height: context.heightResponsive(55),
            onPressed: onPurchase,
            child: Text(
              'PURCHASE',
              style: TextStyle(
                color: SNOColors.black,
                fontSize: context.widthResponsive(16),
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
        body: Container(
          padding:
              EdgeInsets.symmetric(horizontal: context.widthResponsive(10)),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.green,
                  width: context.widthResponsive(340),
                  height: context.widthResponsive(340),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: context.heightResponsive(14),
                      bottom: context.heightResponsive(18)),
                  child: Row(
                    children: [
                      Container(
                        color: Colors.red,
                        width: context.widthResponsive(54),
                        height: context.widthResponsive(54),
                      ),
                      SizedBox(
                        width: context.widthResponsive(7),
                      ),
                      Container(
                        color: Colors.red,
                        width: context.widthResponsive(54),
                        height: context.widthResponsive(54),
                      ),
                      SizedBox(
                        width: context.widthResponsive(7),
                      ),
                      Container(
                        color: Colors.red,
                        width: context.widthResponsive(54),
                        height: context.widthResponsive(54),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Air Jordan High OG',
                  style: TextStyle(
                    color: SNOColors.white,
                    fontSize: context.widthResponsive(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: context.heightResponsive(8),
                ),
                Text(
                  '฿ 6990',
                  style: TextStyle(
                    color: SNOColors.deepGreen,
                    fontSize: context.widthResponsive(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: context.heightResponsive(25),
                ),
                productDetail()
              ],
            ),
          ),
        ));
  }

  Widget productDetail() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: EdgeInsets.only(bottom: context.heightResponsive(6)),
        margin: EdgeInsets.only(bottom: context.heightResponsive(14)),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: SNOColors.white),
          ),
        ),
        child: Text(
          'Product Detail',
          style: TextStyle(
            color: SNOColors.white,
            fontSize: context.widthResponsive(12),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Column(
        children: [
          productDetailRow(label: "Brand", value: "Jordan"),
          productDetailRow(label: "SKU", value: "NIKE-SNSAJ1HOP4"),
          productDetailRow(label: "Colorway", value: "Yellow"),
        ],
      ),
      SizedBox(
        height: context.heightResponsive(30),
      ),
      Column(
        children: buildSizeGrid(),
      )
    ]);
  }

  Container productDetailRow({required String label, required String value}) {
    return Container(
      margin: EdgeInsets.only(bottom: context.heightResponsive(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: SNOColors.white.withOpacity(0.6),
              fontSize: context.widthResponsive(12),
            ),
          ),
          Text(
            value,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: SNOColors.white,
              fontSize: context.widthResponsive(12),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildSizeGrid() {
    List<Widget> rows = [];
    int itemsPerRow = 4;
    for (int i = 0; i < 10; i += itemsPerRow) {
      Row row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(itemsPerRow, (index) {
          int currIdx = i + index;
          if (currIdx < 10) {
            return Expanded(
                child: Container(
              margin: EdgeInsets.all(
                context.widthResponsive(5),
              ),
              child: sizeButton(size: 10),
            ));
          } else {
            return Expanded(child: Container());
          }
        }),
      );
      rows.add(row);
    }

    return rows;
  }

  Container sizeButton({required double size, bool isSelected = false}) {
    bool hasDecimal = size != size.truncate();
    Color color = isSelected ? SNOColors.springGreen : SNOColors.white;
    return Container(
      width: context.widthResponsive(62),
      height: context.heightResponsive(34),
      decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text(
          'US ${hasDecimal ? size.toStringAsFixed(2) : size.toInt()}',
          style: TextStyle(
              color: color,
              fontSize: context.widthResponsive(12),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  void onPurchase() {
    // add id to provider
    Navigator.of(context).pushNamed(SNORouteName.payment);
  }

  void addToWishlist() {}
}
