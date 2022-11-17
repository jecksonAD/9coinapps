import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/home/components/my_bottom_navigation_bar.dart';
import 'package:ninecoin/typography/text_styles.dart';

import '../../../config/helper/auth_helper/auth_helper.dart';
import '../../../model/auth/login/login_response.dart';
import '../../profile/services/profile_service.dart';

class PointQrCode extends StatefulWidget {
  static Route<PointQrCode> route() {
    return MaterialPageRoute(builder: (context) => const PointQrCode());
  }

  const PointQrCode({Key? key}) : super(key: key);

  @override
  State<PointQrCode> createState() => _PointQrCodeState();
}

class _PointQrCodeState extends State<PointQrCode> {
  Data? userId;

  @override
  void initState() {
    // getLocalUser().then((value) {
    //   setState(() {
    //     userId = value;
    //   });
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "QR Code",
          style: CoinTextStyle.title2Bold,
        ),
      ),
      body: FutureBuilder(
          future: localUser(),
          builder: (context, AsyncSnapshot<Map?> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      height: 300,
                      child: Image.network(
                        snapshot.data!['qrcode'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    "ID : ${snapshot.data!['id']}",
                    style: CoinTextStyle.title2Bold,
                  )
                ],
              ),
            );
          }),
    );
  }
}
