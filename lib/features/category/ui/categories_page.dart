import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/category/components/cirlce_category_icon.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'category_details_page.dart';

class CategoryListPage extends StatefulWidget {
  static Route rout() {
    return MaterialPageRoute(builder: (context) => const CategoryListPage());
  }

  const CategoryListPage({Key? key}) : super(key: key);

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(145),
          child: AppBar(
            centerTitle: true,
            title: Text(
              "Categories",
              style: CoinTextStyle.title2Bold,
            ),
            flexibleSpace: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Assets.categories),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: CoinColors.fullBlack.withOpacity(0.5)),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: GridView(
          padding: const EdgeInsets.only(top: 26),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.9,
          ),
          children: [
            CirlceCategoryIcon(
              onTap: () {},
              imageUrl: Assets.salon,
              color: CoinColors.green,
              label: "A'Salon",
            ),
            CirlceCategoryIcon(
              onTap: () {},
              imageUrl: Assets.bag,
              color: CoinColors.pink,
              label: "Bag",
            ),
            CirlceCategoryIcon(
              onTap: () {},
              imageUrl: Assets.beautyIcon,
              color: CoinColors.red12,
              label: "Beauty",
            ),
            CirlceCategoryIcon(
              onTap: () {
                Navigator.push(context, CategoryDetailsPage.route());
              },
              imageUrl: Assets.electronic,
              color: CoinColors.orange12,
              label: "Electronic",
            ),
            CirlceCategoryIcon(
              onTap: () {},
              imageUrl: Assets.fashion,
              color: CoinColors.blue,
              label: "Fashion",
            ),
            CirlceCategoryIcon(
              onTap: () {},
              imageUrl: Assets.gaming,
              color: CoinColors.red,
              label: "Gaming",
            ),
            CirlceCategoryIcon(
              onTap: () {},
              imageUrl: Assets.groceries,
              color: CoinColors.yellow,
              label: "Groceries",
            ),
            CirlceCategoryIcon(
              onTap: () {},
              imageUrl: Assets.pet,
              color: CoinColors.indigo,
              label: "Pets",
            ),
            CirlceCategoryIcon(
              onTap: () {},
              imageUrl: Assets.sports,
              color: CoinColors.blueAccent,
              label: "Sports",
            ),
            CirlceCategoryIcon(
              onTap: () {},
              imageUrl: Assets.voucher,
              color: CoinColors.teal,
              label: "Vouchers",
            ),
            CirlceCategoryIcon(
              onTap: () {},
              imageUrl: Assets.watch,
              color: CoinColors.purple,
              label: "Watches",
            ),
          ],
        ),
      ),
    );
  }
}
