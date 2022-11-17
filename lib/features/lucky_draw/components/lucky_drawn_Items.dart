import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/luckyDraw/lucky_drawn_response.dart';
import '../services/lucky_draw.dart';
import '../ui/drawn_details_page.dart';
import 'drawn_tile.dart';

class LuckyDrwanItems extends StatefulWidget {
  const LuckyDrwanItems({Key? key}) : super(key: key);

  @override
  State<LuckyDrwanItems> createState() => _LuckyDrwanItemsState();
}

class _LuckyDrwanItemsState extends State<LuckyDrwanItems> {
  String? userId;
  late LuckyDrawnResponse luckyDrawn;

  @override
  // void initState() {
  //   getUserId().then((value) => setState(() {
  //         userId = value.toString();
  //       }));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userId == null
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : FutureBuilder<dynamic>(
              future: getLuckyDrawn(userId!),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
                luckyDrawn = snapshot.data;

                return luckyDrawn.data.isEmpty
                    ? const Center(
                        child:
                            Text("You are not participated in luckydraw yet"),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 22),
                        itemCount: 2, //luckyDrawn.data.length
                        itemBuilder: (_, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DrawnTile(
                                onTap: () {
                                  //                       Navigator.push(context, DrawnDetailsPage.route());
                                },
                                title: "wahaj", //luckyDrawn.data[index].name
                                startingDate:
                                    "122", //luckyDrawn.data[index].date.toString()
                                endDate: "",
                              ),
                              Spacer(),
                              ElevatedButton(
                                  onPressed: (() {}), child: Text('Draw'))
                            ],
                          );
                        },
                      );
              }),
      floatingActionButton:
          // FloatingActionButton(
          //   onPressed: () {},
          // child:
          Container(
        alignment: Alignment.center,
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xffFCBA56),
        ),
        child: Text(
          'Draw All',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
    // });
  }
}
