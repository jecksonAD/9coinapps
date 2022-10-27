import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/features/point/api/pointpackage.dart';
import 'package:ninecoin/features/point/components/buy_point_card_tile.dart';

import 'package_buy_page.dart';

class BuyPointPackagePage extends StatelessWidget {
  static route() {
    return MaterialPageRoute(builder: (context) => BuyPointPackagePage());
  }

  BuyPointPackagePage({Key? key}) : super(key: key);
  pointpackage getdata = pointpackage();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CoinColors.fullBlack,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: CoinColors.black,
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Buy Point Package"),
          ),
          body: FutureBuilder<List>(
            future: getdata.getpointpackage(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(height: 24),
                          BuyPointCardTile(
                            onTap: () {
                              Navigator.push(context, PackageBuyPage.route());
                            },
                            packageNum: "Package 2",
                            point: 20,
                            pointDetail: "RM 65",
                          ),
                        ],
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
