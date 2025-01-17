import 'package:flutter/material.dart';
import 'package:sneakout_flutter_firebase/shared/components/card.dart';
import 'package:sneakout_flutter_firebase/shared/layout/layout.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/size.dart';
import 'package:sneakout_flutter_firebase/shared/utils/routes/route_name.dart';

final test = ['1', '2', '3', '4', '5', '6', '7', '7', '7', '7', '7', '7', '7'];

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
        onAvatar: () => {},
        body: SingleChildScrollView(
          child: Column(children: [
            for (int i = 0; i < test.length; i += 2)
              Container(
                margin: EdgeInsets.only(bottom: context.heightResponsive(18)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SNOCard(
                        index: i,
                        onPressed: navigateToDetail,
                        img: Image.asset(
                            ''), // change from asset image to memory or network
                        label: "Jordan 1 High OG",
                        price: 6999.10),
                    if (i + 1 < test.length)
                      SNOCard(
                          index: i + 1,
                          onPressed: navigateToDetail,
                          img: Image.asset(''),
                          label: "Air Jordan 1 High OG",
                          price: 6999.00),
                    if (i + 1 >= test.length)
                      const Expanded(
                        child: SizedBox(),
                      ), // Add empty space for alignment
                  ],
                ),
              ),
          ]),
        ));
  }

  void navigateToDetail(int index) {
    // add id to provider
    Navigator.of(context).pushNamed(SNORouteName.detail);
  }
}
