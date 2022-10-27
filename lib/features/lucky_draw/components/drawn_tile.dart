import 'package:flutter/material.dart';

class DrawnTile extends StatelessWidget {
  final String title;
  final String startingDate;
  final String endDate;
  final Function() onTap;
  const DrawnTile({
    Key? key,
    required this.title,
    required this.startingDate,
    required this.endDate,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title),
                    Text("$startingDate - $endDate"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
