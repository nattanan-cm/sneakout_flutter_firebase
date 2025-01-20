import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sneakout_flutter_firebase/models/sneaker_model.dart';
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

SneakerDetailModel data = SneakerDetailModel(
  brand: "Jordan",
  colors: [
    ColorWay(label: "Yellow", imagePath: ''),
    ColorWay(label: "Blue", imagePath: ''),
  ],
  imagePath: '',
  sku: "NIKE-SNSAK1HOP4",
  label: "Air Jordan 1 HIGH OG",
  price: 6990,
  sizes: [10, 9.5, 7, 7.5, 5, 6, 6.5, 14, 13, 12, 11, 9],
);

int colorIdx = 0;
int? sizeIdx;

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
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  child: Container(
                    color: Colors.green,
                    width: context.widthResponsive(340),
                    height: context.widthResponsive(340),
                    child: Image.asset(
                      ImagePaths.avatar,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: context.heightResponsive(14),
                      bottom: context.heightResponsive(18)),
                  child: Row(
                    children: data.colors?.map((e) {
                          int index = data.colors!.indexOf(e);
                          return Container(
                            margin: EdgeInsets.only(
                                right: e != data.colors!.last
                                    ? context.widthResponsive(8)
                                    : 0.0),
                            child: colorwayButton(
                                isSelected: index == colorIdx,
                                onPressed: () => onColorway(index)),
                          );
                        }).toList() ??
                        [],
                  ),
                ),
                Text(
                  data.label ?? '',
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
                  data.priceStr(),
                  style: TextStyle(
                    color: SNOColors.deepGreen,
                    fontSize: context.widthResponsive(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: context.heightResponsive(25),
                ),
                productDetail(
                  brand: data.brand,
                  sku: data.sku,
                  colorway: data.colors?[colorIdx].label,
                  sizes: data.sizes,
                )
              ],
            ),
          ),
        ));
  }

  Widget colorwayButton(
      {bool isSelected = false, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: isSelected
              ? Border.all(color: const Color(0xFF06F3E5), width: 2)
              : null,
        ),
        width: context.widthResponsive(54),
        height: context.widthResponsive(54),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            ImagePaths.avatar,
            fit: BoxFit.cover,
            opacity: isSelected ? null : const AlwaysStoppedAnimation(0.6),
          ),
        ),
      ),
    );
  }

  Widget productDetail(
      {String? sku, String? brand, String? colorway, List<double>? sizes}) {
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
          productDetailRow(label: "Brand", value: brand ?? ''),
          productDetailRow(label: "SKU", value: sku ?? ''),
          productDetailRow(label: "Colorway", value: colorway ?? ''),
        ],
      ),
      SizedBox(
        height: context.heightResponsive(30),
      ),
      Column(
        children: buildSizeGrid(sizes),
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
              color: SNOColors.white.withValues(alpha: 0.6),
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

  List<Widget> buildSizeGrid(List<double>? sizes) {
    List<Widget> rows = [];
    int itemsPerRow = 4;

    if (sizes == null || sizes.isEmpty) return [];

    for (int i = 0; i < sizes.length; i += itemsPerRow) {
      Row row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(itemsPerRow, (index) {
          int currIdx = i + index;
          if (currIdx < sizes.length) {
            return Expanded(
                child: Container(
              margin: EdgeInsets.all(
                context.widthResponsive(5),
              ),
              child: GestureDetector(
                onTap: () {
                  sizeIdx = currIdx;
                  setState(() {});
                },
                child: sizeButton(
                    size: sizes[currIdx],
                    isSelected: sizeIdx != null && sizeIdx == currIdx),
              ),
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

  void onColorway(int idx) {
    colorIdx = idx;
    setState(() {});
  }

  void addToWishlist() {}
}
