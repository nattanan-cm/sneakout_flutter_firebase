import 'package:flutter/material.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/colors.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/size.dart';
import 'package:sneakout_flutter_firebase/shared/utils/path/path.dart';

class SNOCard extends StatelessWidget {
  final Image img;
  final int index;
  final String label;
  final double price;
  final void Function(int) onPressed;

  const SNOCard({
    super.key,
    required this.index,
    required this.onPressed,
    required this.img,
    required this.label,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    bool hasDecimal = price != price.truncate();
    return GestureDetector(
      onTap: () => onPressed(index),
      child: Container(
        width: context.widthResponsive(155),
        height: context.heightResponsive(200),
        decoration: BoxDecoration(
          color: SNOColors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  child: Image.asset(
                    ImagePaths.avatar,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              height: context.heightResponsive(60),
              width: context.widthResponsive(150),
              padding: EdgeInsets.symmetric(
                  vertical: context.heightResponsive(5),
                  horizontal: context.widthResponsive(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: context.widthResponsive(14),
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: context.heightResponsive(5),
                  ),
                  Text(
                    '฿ ${hasDecimal ? price.toStringAsFixed(2) : price.toInt()}',
                    style: TextStyle(
                        fontSize: context.widthResponsive(14),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF038C10)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
