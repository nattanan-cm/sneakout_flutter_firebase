import 'package:flutter/material.dart';
import 'package:sneakout_flutter_firebase/models/sneaker_model.dart';
import 'package:sneakout_flutter_firebase/shared/components/card.dart';
import 'package:sneakout_flutter_firebase/shared/layout/layout.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/colors.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/size.dart';
import 'package:sneakout_flutter_firebase/shared/utils/routes/route_name.dart';

Map<String, List<SneakerModel>> test = {
  "jordan": [
    SneakerModel(label: 'test', price: 1000.1, imagePath: ''),
    SneakerModel(label: 'test', price: 1000.1, imagePath: ''),
    SneakerModel(label: 'test', price: 1000.1, imagePath: ''),
    SneakerModel(label: 'test', price: 1000.1, imagePath: ''),
    SneakerModel(label: 'test', price: 1000.1, imagePath: ''),
    SneakerModel(label: 'test', price: 1000.1, imagePath: ''),
    SneakerModel(label: 'test', price: 1000.1, imagePath: ''),
  ],
  "nike": [SneakerModel(label: 'test', price: 1000.1, imagePath: '')],
  "fila": [SneakerModel(label: 'test', price: 1000.1, imagePath: '')],
  "oncloud": [SneakerModel(label: 'test', price: 1000.1, imagePath: '')],
  "adidas": [SneakerModel(label: 'test', price: 1000.1, imagePath: '')],
};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SNOLayout(
        showAvatar: true,
        showLogo: true,
        hasHorizontalScroll: true,
        onAvatar: () => {},
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: test.keys.map((brand) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: context.widthResponsive(10),
                        bottom: context.heightResponsive(12)),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                    child: Text(
                      brand.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: context.widthResponsive(18)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: brand != test.keys.last
                            ? context.heightResponsive(15)
                            : 0.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: buildRow(test[brand] ?? []),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ));
  }

  List<Container> buildColumn(Map<String, List<SneakerModel>> data) {
    return data.keys.map((brand) {
      return Container(
        margin: EdgeInsets.only(
            bottom:
                brand != data.keys.last ? context.heightResponsive(15) : 0.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: buildRow(data[brand] ?? []),
        ),
      );
    }).toList();
  }

  Row buildRow(List<SneakerModel> sneakers) {
    return Row(
      children: sneakers.map((item) {
        int index = sneakers.indexOf(item);
        return Container(
          margin: EdgeInsets.only(
            right: index != (sneakers.length - 1)
                ? context.widthResponsive(10)
                : 0.0,
          ),
          child: SNOCard(
            index: index,
            onPressed: navigateToDetail,
            img: Image.asset(item.imagePath ??
                ''), // change from asset image to memory or network
            label: item.label ?? '',
            price: item.priceStr(),
          ),
        );
      }).toList(),
    );
  }

  void navigateToDetail(int index) {
    // add id to provider
    Navigator.of(context).pushNamed(SNORouteName.detail);
  }
}
