import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/point/ui/package_payment_page.dart';
import 'package:ninecoin/typography/text_styles.dart';

class PackageBuyPage extends StatelessWidget {
  static route() {
    return MaterialPageRoute(builder: (_) => const PackageBuyPage());
  }

  const PackageBuyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Package 2"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Package 2", style: CoinTextStyle.title3),
                  const SizedBox(height: 3.0),
                  Text('''Mauris non ligula tempus, lacinia velit a, aliquam
metus. Nulla at sapien scelerisque, imperdiet ex non,
venenatis mi.''', style: CoinTextStyle.title4),
                  const SizedBox(height: 18.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "20",
                          style:
                              CoinTextStyle.orangeTitle1.copyWith(fontSize: 26),
                          children: [
                            TextSpan(
                              text: " Point",
                              style: CoinTextStyle.title2,
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Total :",
                          style: CoinTextStyle.title2,
                          children: [
                            TextSpan(
                              text: " RM 65",
                              style: CoinTextStyle.orangeTitle1
                                  .copyWith(fontSize: 26),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 24),
                  Text("Term and Condition",
                      style: CoinTextStyle.title3Bold
                          .copyWith(color: CoinColors.dialogTextColor)),
                  const SizedBox(height: 6.0),
                  Text(
                      "1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      style: CoinTextStyle.title4),
                  const SizedBox(height: 6.0),
                  Text(
                      "2. Proin et orci in quam porta condimentum. Mauris non ligula tempus, lacinia velit a, aliquam metus.",
                      style: CoinTextStyle.title4),
                  const SizedBox(height: 6.0),
                  Text(
                      "3. Nulla atone sapien scelerisque, imperdiet exq non, venenatis mi.",
                      style: CoinTextStyle.title4),
                  const SizedBox(height: 6.0),
                  Text(
                      "4. Nullam arcu leo, blandit nec consequat vel, molestie et sem.",
                      style: CoinTextStyle.title4),
                  const SizedBox(height: 6.0),
                  Text(
                      "5. Praesent pretium erat at nulla euismod, a rutrum elit blandit. Etiam nec aliquam metus.",
                      style: CoinTextStyle.title4),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(context, PackagePaymentPage.route());
              },
              child: const Text("Pay"),
            ),
          ],
        ),
      ),
    );
  }
}
