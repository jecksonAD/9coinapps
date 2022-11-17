import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/category/ui/product_details_page.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/typography/text_styles.dart';

class CategoryDetailsPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => const CategoryDetailsPage());
  }

  const CategoryDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoinColors.black,
      appBar: AppBar(
        backgroundColor: CoinColors.black12,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Electronic",
          style: CoinTextStyle.title2Bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 70,
              color: CoinColors.black12,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: CoinColors.black,
                          prefixIcon: Icon(
                            Icons.search,
                            color: CoinColors.black26,
                          ),
                          hintText: "Search",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            RoundedElectricCard(
              onTap: () {},
              imageUrl: Assets.television1,
              title: "Sonyod SDN. BHD.",
              pNumber: "010 - 559 6689",
              location: "No. 12, Jalan Bukit Baru, 75150 Melaka.",
            ),
            RoundedElectricCard(
              onTap: () {
                Navigator.push(context, ProductDetailsPage.route());
              },
              imageUrl: Assets.earphone,
              title: "Yonqed SDN. BHD.",
              pNumber: "012 - 683 2269",
              location: "2a, Jalan Klebang Jaya 3, 75200 Melaka.",
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedElectricCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String pNumber;
  final String location;
  final Function() onTap;
  const RoundedElectricCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.pNumber,
    required this.location,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15.0),
            height: 240,
            width: 400,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: CoinColors.fullBlack,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6.0),
                            topRight: Radius.circular(6.0),
                          ),
                          child: Image.asset(
                            imageUrl,
                            fit: BoxFit.cover,
                            height: 120,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(title,
                            style: CoinTextStyle.title3Bold.copyWith(
                                color: CoinColors.orange,
                                fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.phone, size: 16.0),
                          ),
                          Text(pNumber, style: CoinTextStyle.title4),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.location_on_rounded, size: 16.0),
                          ),
                          Flexible(
                            child: Text(location, style: CoinTextStyle.title5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
