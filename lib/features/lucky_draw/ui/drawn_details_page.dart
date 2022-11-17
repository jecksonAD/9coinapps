import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/config/helper/auth_helper/auth_helper.dart';
import 'package:ninecoin/features/lucky_draw/components/my_timer.dart';
import 'package:ninecoin/features/lucky_draw/services/lucky_draw.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'package:ninecoin/widgets/lucky_draw_information_page.dart';

class DrawnDetailsPage extends StatelessWidget {
  static route() {
    return MaterialPageRoute(builder: (context) {
      return const DrawnDetailsPage();
    });
  }

  const DrawnDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Imperdiet Ex Non"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: InkWell(
                onTap: () {
                  Navigator.push(context, LuckDrawInformationPage.route());
                },
                child: Image.asset(Assets.information, height: 20, width: 20)),
          ),
        ],
      ),
      body: FutureBuilder(
          future: getLocalUser(),
          builder: (context, AsyncSnapshot<Map?> snapshot) {
            if (!snapshot.hasData) {
              return Container();
            } else {
              return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("User Info",
                                  style: CoinTextStyle.orangeTitle3),
                              const SizedBox(height: 4.0),
                              MyDataRow(
                                  title: "User ID",
                                  value: "${snapshot.data!['qrcode']}"),
                              MyDataRow(
                                  title: "User Name",
                                  value: "${snapshot.data!['name']}"),
                              MyDataRow(
                                  title: "Email",
                                  value: "${snapshot.data!['email']}"),
                              const SizedBox(height: 6.0),
                              const Divider(),
                              const SizedBox(height: 12.0),
                              Text("Draws", style: CoinTextStyle.orangeTitle3),
                              const MyDataRow(
                                  title: "Number of Draws", value: "5"),
                              const MyDataRow(
                                  title: "Total Points", value: "250"),
                              const SizedBox(height: 6.0),
                              const Divider(),
                              const SizedBox(height: 12.0),
                              Text("Pool Info",
                                  style: CoinTextStyle.orangeTitle3),
                              const MyDataRow(
                                  title: "Pool Name",
                                  value: "Imperdiet Ex Non"),
                              const MyDataRow(
                                  title: "Participate ID", value: "#33895583"),
                              const MyDataRow(
                                  title: "Total Point", value: "350"),
                              const MyDataRow(
                                  title: "Pool Period",
                                  value: "1/5/2022 - 31/5/2022"),
                              const MyDataRow(
                                  title: "Draw Time", value: "1/6/2022"),
                              const MyDataRow(
                                  title: "Rewards",
                                  value: "Iphone 13 Pro Max 256G"),
                              const SizedBox(height: 6.0),
                              const Divider(),
                              const SizedBox(height: 24.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Winning Result",
                                      style: CoinTextStyle.orangeTitle3),
                                ],
                              ),
                              const SizedBox(height: 24.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text("Not yet Announced",
                                          style: CoinTextStyle.title3.copyWith(
                                              color: CoinColors.black54)),
                                      Text("Status",
                                          style: CoinTextStyle.title3.copyWith(
                                              color: CoinColors.black54)),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24.0),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                              onPressed: () async {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        alignment: Alignment.center,
                                        backgroundColor: CoinColors.transparent,
                                        child: MyHomePage(
                                            email: snapshot.data!['email']),
                                      );
                                    });
                              },
                              child: const Text("Draw")),
                          const SizedBox(height: 6.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Left 5 times",
                                  style: CoinTextStyle.title4Bold
                                      .copyWith(color: CoinColors.black54)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ));
            }
          }),
    );
  }
}

class MyDataRow extends StatelessWidget {
  final String title;
  final String value;

  const MyDataRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
              width: 140,
              child: Text(title,
                  style: CoinTextStyle.title3
                      .copyWith(color: CoinColors.black54))),
          Text(value, style: CoinTextStyle.title3),
        ],
      ),
    );
  }
}
