import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/typography/text_styles.dart';

class ProductDetailsPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => const ProductDetailsPage());
  }

  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(145),
          child: AppBar(
            centerTitle: true,
            title: const Text("Yonqed SDN. BHD."),
            flexibleSpace: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Assets.earphone),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: Container(
                    color: CoinColors.fullBlack.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: CoinColors.dialogTextColor,
              unselectedLabelColor: CoinColors.black54,
              labelStyle: CoinTextStyle.title2,
              indicatorPadding: const EdgeInsets.all(16),
              labelPadding: const EdgeInsets.all(12),
              tabs: const [
                Tab(text: "Details"),
                Tab(text: "Products"),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ProductDetails(),
                  Products(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15),

      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Yonqed SDN. BHD.",
          style: CoinTextStyle.title2Bold.copyWith(color: CoinColors.orange),
        ),
        Text(
          "yongqed@gmail.com",
          style: CoinTextStyle.title4,
        ),
        Text(
          "012 - 683 2269",
          style: CoinTextStyle.title4,
        ),
        Text(
          "2a, Jalan Klebang Jaya 3, 75200 Melaka.",
          style: CoinTextStyle.title4,
        ),
        const SizedBox(height: 16),
        const Divider(thickness: 2),
        const SizedBox(height: 12),
        Text(
          "Description",
          style: CoinTextStyle.title3Bold.copyWith(color: CoinColors.orange),
        ),
        const SizedBox(height: 6),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit .Proin et orci in quam porta condimentum. Mauris non ligula tempus, lacinia velit a, aliquam metus. Nulla at sapien scelerisque, imperdiet ex non.",
          textAlign: TextAlign.left,
          style: CoinTextStyle.title3,
        ),
        const SizedBox(height: 12),
        const Divider(thickness: 2),
        const SizedBox(height: 12),
        Text(
          "Our Services",
          style: CoinTextStyle.title3Bold.copyWith(color: CoinColors.orange),
        ),
        const SizedBox(height: 6),
        Text("1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            style: CoinTextStyle.title4.copyWith(
              letterSpacing: 0.5,
            )),
        const SizedBox(height: 6),
        Text(
            "2. Proin et orci in quam porta condimentum. Mauris non ligula tempus, lacinia velit a, aliquam metus.",
            style: CoinTextStyle.title4.copyWith(
              letterSpacing: 0.5,
            )),
        const SizedBox(height: 6),
        Text(
            "3. Nulla atone sapien scelerisque, imperdiet exq non, venenatis mi.",
            style: CoinTextStyle.title4.copyWith(
              letterSpacing: 0.5,
            )),
        const SizedBox(height: 6),
        Text("4. Nullam arcu leo, blandit nec consequat vel, molestie et sem.",
            style: CoinTextStyle.title4.copyWith(
              letterSpacing: 0.5,
            )),
        const SizedBox(height: 6),
        Text(
            "5. Praesent pretium erat at nulla euismod, a rutrum elit blandit. Etiam nec aliquam metus.",
            style: CoinTextStyle.title4.copyWith(
              letterSpacing: 0.5,
            )),
        const SizedBox(height: 16),
      ],
    );
  }
}

class Products extends StatelessWidget {
  Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: GridView.builder(
        itemCount: productcard.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: 0.5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          return productcard[index];
        },
      ),
    );
  }
}

List<Widget> productcard = [
  ProductCard(imageURL: Assets.earphone),
  ProductCard(imageURL: Assets.earphone2),
  ProductCard(imageURL: Assets.earphone3),
  ProductCard(imageURL: Assets.earphone4),
];

class ProductCard extends StatelessWidget {
  final String imageURL;
  ProductCard({Key? key, required this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageURL),
        ),
      ),
    );
  }
}
