import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';
import 'package:ninecoin/features/lucky_draw/services/lucky_draw.dart';
import 'package:ninecoin/features/lucky_draw/ui/draw_details_page.dart';
import '../../../model/luckyDraw/lucky_draw_response.dart';
import 'rounded_draw_card.dart';

class DrawItemsList extends StatelessWidget {
  DrawItemsList({Key? key}) : super(key: key);

  late LuckyDrawResponse luckyDrawData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LuckyDrawResponse>(
        future: getLuckyDraw(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          luckyDrawData = snapshot.data!;
          return ListView.builder(
              itemCount: luckyDrawData.data.length,
              itemBuilder: (contect, index) {
                return RoundedDrawCard(
                  onTap: () {
                    Navigator.push(
                        context, DrawDetailsPage.route(luckyDraw: luckyDrawData, index: index));
                  },
                  imageUrl: luckyDrawData.data[index].prizeImage,
                  title: luckyDrawData.data[index].name,
                  boxTitle: luckyDrawData.data[index].description,
                  date: luckyDrawData.data[index].date.toString(),
                );
              });
        });
  }
}
