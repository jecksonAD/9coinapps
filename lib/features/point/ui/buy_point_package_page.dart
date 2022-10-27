import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/features/point/components/buy_point_card_tile.dart';

import 'package_buy_page.dart';

class BuyPointPackagePage extends StatelessWidget {
  static route() {
    return MaterialPageRoute(builder: (context) => const BuyPointPackagePage());
  }

  const BuyPointPackagePage({Key? key}) : super(key: key);

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
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 24),
              BuyPointCardTile(
                onTap: () {},
                packageNum: "Package 1",
                point: 10,
                pointDetail: "RM 35",
              ),
              BuyPointCardTile(
                onTap: () {
                  Navigator.push(context, PackageBuyPage.route());
                },
                packageNum: "Package 2",
                point: 20,
                pointDetail: "RM 65",
              ),
              BuyPointCardTile(
                onTap: () {},
                packageNum: "Package 3",
                point: 30,
                pointDetail: "RM 120",
              ),
              BuyPointCardTile(
                onTap: () {},
                packageNum: "Package 4",
                point: 50,
                pointDetail: "RM 150",
              ),
              BuyPointCardTile(
                onTap: () {},
                packageNum: "Package 5",
                point: 100,
                pointDetail: "RM 280",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
