import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/category/ui/categories_page.dart';
import 'package:ninecoin/features/coupon/ui/coupon_page.dart';
import 'package:ninecoin/features/home/api/category.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/features/home/components/tab_item.dart';
import 'package:ninecoin/features/notification/ui/notifications_page.dart';
import 'package:ninecoin/model/news/news_model.dart';
import 'package:ninecoin/typography/text_styles.dart';
import '../../../model/notification/notification_model.dart';
import '../../category/api/merchant.dart';
import '../../category/ui/category_details_page.dart';
import '../../category/ui/product_details_page.dart';
import '../../lucky_draw/ui/luckydraw_page.dart';
import '../../news/services/news.dart';
import '../../news/ui/news_details_page.dart';
import '../../news/ui/news_page.dart';
import '../../notification/services/notification_services.dart';
import '../../point/ui/point_page.dart';
import '../../profile/ui/profile_page.dart';
import '../components/category_circular_card.dart';
import '../components/circle_icon.dart';
import '../components/rounded_feature_card.dart';
import '../components/rounded_news_card.dart';

class HomePage extends StatefulWidget {
  final Widget? body;
  const HomePage({Key? key, this.body}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  NotificationModel? notification;
  List<Widget> pages = [
    HomeScreen(),
    CouponPage(),
    PointPage(),
    LuckydrawPage(),
    NewsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NotificationModel>(
        future: getNotification(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: CoinColors.white,
                ),
              ),
            );
          }
          notification = snapshot.data;
          return Scaffold(
            bottomNavigationBar: MyBottomNavigationBar(
              onSelectTab: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              currentTab: currentPage,
            ),
            appBar: AppBar(
              leadingWidth: 120,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Image.asset(Assets.appLogo),
              ),
              actions: [
                CircleIcon(
                  onTap: () {
                    Navigator.push(
                        context, NotificationPage.route(notification!));
                  },
                  icon: Badge(
                    padding: const EdgeInsets.all(4),
                    position: BadgePosition.topEnd(top: -2, end: -8),
                    badgeContent: Text(notification!.data.length.toString(),
                        style: CoinTextStyle.title5),
                    child: const Icon(Icons.notifications,
                        color: CoinColors.orange, size: 20),
                  ),
                ),
                const SizedBox(width: 12.0),
                CircleIcon(
                  onTap: () {
                    Navigator.push(context, ProfilePage.route());
                  },
                  icon: Image.asset(
                    Assets.profileIcon,
                    height: 20.5,
                    width: 20.5,
                    color: CoinColors.orange,
                  ),
                ),
                const SizedBox(width: 16.0),
              ],
            ),
            backgroundColor: CoinColors.black12,
            body: pages[currentPage],
          );
        });
  }
}

class HomeScreen extends StatelessWidget {
  Merchant getdata = Merchant();
  Category getcategorydata = Category();
  HomeScreen({Key? key}) : super(key: key);
  late GetNews news;
  Widget newspage = NewsPage();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 0, 0, 0),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: Image.asset("assets/pics/slider.jpg")),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CategoryListPage.rout());
                      },
                      child: Text("View all",
                          style: CoinTextStyle.title3
                              .copyWith(color: CoinColors.orange)),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder<List>(
                  future: getcategorydata.getcategoryrandom(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        children: <Widget>[
                          for (int i = 0; i < snapshot.data!.length; i++)
                            CategoryCircularCard(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CategoryDetailsPage(
                                          snapshot.data![i]['name']
                                              .toString())));
                                },
                                imageurl: snapshot.data![i]['imageurl'],
                                imageUrl: Assets.salon,
                                color: CoinColors.transparent,
                                label: snapshot.data![i]['name'].toString()),
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Features", style: CoinTextStyle.title1),
                    InkWell(
                      onTap: () {},
                      child: Text("",
                          style: CoinTextStyle.title3
                              .copyWith(color: CoinColors.orange)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder<List>(
                    future: getdata.Featuremerchant(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Row(
                          children: <Widget>[
                            for (int i = 0; i < snapshot.data!.length; i++)
                              RoundedFeatureCard(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProductDetailsPage(
                                          snapshot.data![i]['id'],
                                          snapshot.data![i]['name'],
                                          snapshot.data![i]['image'],
                                          snapshot.data![i]
                                              ['totalproductimage'],
                                          snapshot.data![i]['randomnumber'])));
                                },
                                imageUrl: snapshot.data![i]['image'],
                                title: snapshot.data![i]['name'],
                                pNumber: snapshot.data![i]['phone'],
                                location: snapshot.data![i]['address'],
                              )
                          ],
                        );
                      } else
                        return CircularProgressIndicator();
                    }),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("News", style: CoinTextStyle.title1),
                    InkWell(
                      onTap: () {
                        //print("test");
                      },
                      child: Text("",
                          style: CoinTextStyle.title3
                              .copyWith(color: CoinColors.orange)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder<GetNews>(
                    future: FeatureNews(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        news = snapshot.data!;
                        return Row(
                          children: <Widget>[
                            for (int i = 0; i < news.data.length; i++)
                              RoundedNewsCard(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      NewsDetailsPage.route(
                                          news: news, index: i));
                                },
                                imageUrl: news.data[i].photo,
                                date: news.data[i].date,
                                title: news.data[i].name,
                                desc: "",
                              )
                          ],
                        );
                      } else
                        return Center(child: CircularProgressIndicator());
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}