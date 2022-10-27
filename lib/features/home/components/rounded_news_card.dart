import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/typography/text_styles.dart';

class RoundedNewsCard extends StatelessWidget {
  final String imageUrl;
  final String date;
  final String title;
  final String desc;
  final Function() onTap;

  const RoundedNewsCard(
      {Key? key,
      required this.imageUrl,
      required this.date,
      required this.title,
      required this.desc,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            width: 172,
            height: 226,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: CoinColors.black,
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
                          child: Image.network(imageUrl, fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(date,
                            style: CoinTextStyle.title5
                                .copyWith(color: CoinColors.black54)),
                        Text(title,
                            style: CoinTextStyle.title4.copyWith(
                              color: CoinColors.orange,
                            )),
                        Flexible(
                            child: Text(desc, style: CoinTextStyle.title4)),
                      ],
                    ),
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
