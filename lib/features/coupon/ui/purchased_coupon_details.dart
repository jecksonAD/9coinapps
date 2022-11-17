import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/typography/text_styles.dart';

class PurchasedCouponDetails extends StatelessWidget {
  static Route<PurchasedCouponDetails> route() {
    return MaterialPageRoute(builder: (_) => const PurchasedCouponDetails());
  }

  const PurchasedCouponDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Color Ins Salon",
            style: CoinTextStyle.title3Bold,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: Image.asset(Assets.dyehair)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "J'Qroue",
                        style: CoinTextStyle.title3Bold
                            .copyWith(color: CoinColors.orange),
                      ),
                      const Text("jqroue@gmail.com"),
                      const Text("017 - 169 5582"),
                      Text(
                        "NO 11, Jln Blok 1, Felda Papan TTimur, 81900 Ayer Tawar,Johor",
                        style: CoinTextStyle.title4,
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text("Our Service",
                        style: CoinTextStyle.title3Bold
                            .copyWith(color: CoinColors.orange)),
                    const Text("- Dye Hair"),
                    const SizedBox(height: 10),
                  ],
                ),
                const Divider(thickness: 2),
                Container(
                  padding: const EdgeInsets.only(top: 7),
                  height: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Term and Condition",
                        style: CoinTextStyle.title3Bold
                            .copyWith(color: CoinColors.orange),
                      ),
                      Text(
                          "1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                          style: CoinTextStyle.title4),
                      Text(
                          "2. Proin et orci in quam porta condimentum. Mauris non ligula tempus, lacinia velit a, aliquam metus.",
                          style: CoinTextStyle.title4),
                      Text(
                          "3. Nulla atone sapien scelerisque, imperdiet exq non, venenatis mi.",
                          style: CoinTextStyle.title4),
                      Text(
                          "4. Nullam arcu leo, blandit nec consequat vel, molestie et sem.",
                          style: CoinTextStyle.title4),
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Original Point",
                            style: CoinTextStyle.title3Bold.copyWith(
                                color: CoinColors.black26,
                                fontWeight: FontWeight.w900),
                          ),
                          const Text(
                            "50",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                decorationThickness: 2,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 35,
                                color: CoinColors.orange,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Promotion Point",
                            style: CoinTextStyle.title3Bold.copyWith(
                                color: CoinColors.black26,
                                fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              const Text(
                                "40",
                                style: TextStyle(
                                    fontSize: 35,
                                    color: CoinColors.orange,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Point",
                                style: CoinTextStyle.title1Bold,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                const SizedBox(height: 5),
                Text(
                  "Expired Date",
                  textAlign: TextAlign.center,
                  style: CoinTextStyle.title3Bold
                      .copyWith(color: CoinColors.orange),
                ),
                Text(
                  "1/5/2022 - 31/5/2022",
                  textAlign: TextAlign.center,
                  style: CoinTextStyle.title3,
                ),
                const SizedBox(height: 5),
                const Divider(thickness: 2),
                const SizedBox(height: 9),
                Text(
                  "Coupon Code",
                  textAlign: TextAlign.center,
                  style: CoinTextStyle.title3Bold
                      .copyWith(color: CoinColors.orange),
                ),
                const SizedBox(height: 5),
                Text(
                  "138953362209",
                  textAlign: TextAlign.center,
                  style: CoinTextStyle.title1,
                ),
                const SizedBox(height: 15),
                Text(
                  "When you come to the store,\nplease show the coupon code to the clerk.",
                  textAlign: TextAlign.center,
                  style: CoinTextStyle.title4.copyWith(
                    color: CoinColors.green,
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
