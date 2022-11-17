import 'package:badges/badges.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/category/ui/categories_page.dart';
import 'package:ninecoin/features/coupon/ui/coupon_page.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/features/home/components/tab_item.dart';
import 'package:ninecoin/features/notification/services/notification_services.dart';
import 'package:ninecoin/features/notification/ui/notifications_page.dart';
import 'package:ninecoin/typography/text_styles.dart';
import '../../../model/notification/notification_model.dart';
import '../../lucky_draw/ui/luckydraw_page.dart';
import '../../news/ui/news_page.dart';
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
  String deviceTokenToSendPushNotification = "";

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((message) {
      print('Firebase');
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print("message.data11 ${message.data}");
      }
    });

    super.initState();
  }

  int currentPage = 0;
  NotificationModel? notification;

  List<Widget> pages = [
    const HomeScreen(),
    const CouponPage(),
    const PointPage(),
    const LuckydrawPage(),
    NewsPage(),
  ];

  @override

// Future<void> getDeviceTokenToSendNotification()async {
//   final FirebaseMessaging _fcm = FirebaseMessaging.instance;
//   final token = await _fcm.getToken();
//   deviceTokenToSendPushNotification = token.toString();
//   print("Token Value $deviceTokenToSendPushNotification");

// }

  Widget build(BuildContext context) {
    // getDeviceTokenToSendNotification();
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
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: CoinColors.black,
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
                child: Row(
                  children: [
                    CategoryCircularCard(
                      onTap: () {},
                      imageUrl: Assets.salon,
                      color: CoinColors.transparent,
                      label: "A'Salon",
                    ),
                    CategoryCircularCard(
                      onTap: () {},
                      imageUrl: Assets.beautyIcon,
                      color: CoinColors.transparent,
                      label: "Beauty",
                    ),
                    CategoryCircularCard(
                      onTap: () {},
                      imageUrl: Assets.electronic,
                      color: CoinColors.transparent,
                      label: "Electronic",
                    ),
                    CategoryCircularCard(
                      onTap: () {},
                      imageUrl: Assets.groceries,
                      color: CoinColors.transparent,
                      label: "Groceries",
                    ),
                    CategoryCircularCard(
                      onTap: () {},
                      imageUrl: Assets.sports,
                      color: CoinColors.transparent,
                      label: "Sports",
                    ),
                  ],
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
                      child: Text("View all",
                          style: CoinTextStyle.title3
                              .copyWith(color: CoinColors.orange)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RoundedFeatureCard(
                      onTap: () {},
                      imageUrl: Assets.beautyPic,
                      title: "J'Qroue",
                      pNumber: "016 - 338 22888",
                      location: "Taman Berkeley, 41150 Klang, Selangor",
                    ),
                    RoundedFeatureCard(
                      onTap: () {},
                      imageUrl: Assets.bookShoop,
                      title: "ChangYi Book Shop",
                      pNumber: "017 - 169 5882",
                      location: "No 11, Jln Blok 1, Felda Papan Timur, 81900.",
                    ),
                  ],
                ),
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
                      onTap: () {},
                      child: Text("View all",
                          style: CoinTextStyle.title3
                              .copyWith(color: CoinColors.orange)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RoundedNewsCard(
                      onTap: () {},
                      imageUrl: Assets.chickenRice1,
                      date: "3/5/2022",
                      title: "Price of Chicken Dishes...",
                      desc: "Lorem ipsum dolor sit amet,.",
                    ),
                    RoundedNewsCard(
                      onTap: () {},
                      imageUrl: Assets.maximise,
                      date: "10/5/2022",
                      title: "Maximise Your Creative",
                      desc: "Lorem ipsum dolor sit amet,.",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
