import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'package:ninecoin/utilities/dialogs/redeem_item_dialog.dart';
import 'package:ninecoin/utilities/dialogs/redeemed_successful_dialog.dart';

class RedeemCardDetailsPage extends StatelessWidget {
  static route() {
    return MaterialPageRoute(
        builder: (context) => const RedeemCardDetailsPage());
  }

  const RedeemCardDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CoinColors.fullBlack,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("J'Qroue"),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            children: [
              Image.asset(Assets.foundation),
              const SizedBox(height: 12.0),
              Text("J'Qroue", style: CoinTextStyle.orangeTitle2),
              const SizedBox(height: 8.0),
              Text("Email : yongqed@gmail.com", style: CoinTextStyle.title3),
              Text("Contact Number : 012 - 683 2269",
                  style: CoinTextStyle.title3),
              Text("Address : 2a, Jalan Klebang Jaya 3, 75200 Melaka",
                  style: CoinTextStyle.title3),
              const SizedBox(height: 12.0),
              const Divider(),
              const SizedBox(height: 8.0),
              Text("Product", style: CoinTextStyle.orangeTitle3),
              const SizedBox(height: 8.0),
              Text("Item - foundation x 1", style: CoinTextStyle.title3),
              const SizedBox(height: 8.0),
              const Divider(),
              RichText(
                text: TextSpan(
                  text: "Total :",
                  style: CoinTextStyle.title3,
                  children: [
                    TextSpan(
                      text: " 25",
                      style: CoinTextStyle.orangeTitle1.copyWith(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: "Point",
                          style: CoinTextStyle.orangeTitle1.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 12.0),
              Text("Term and Condition", style: CoinTextStyle.orangeTitle3),
              const SizedBox(height: 8.0),
              Text(
                  '''1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\n2. Proin et orci in quam porta condimentum. Mauris non ligula tempus, lacinia velit a, aliquam metus. \n\n3. Nulla atone sapien scelerisque, imperdiet exq non, venenatis mi.
      ''',
                  style: CoinTextStyle.title3.copyWith()),
              ElevatedButton(
                  onPressed: () async {
                    if (await showRedeemItemDialog(context)) {
                      await showRedeemedSuccessfulDialog(context);
                    }
                  },
                  child: const Text("Redeem"))
            ],
          ),
        ),
      ),
    );
  }
}
