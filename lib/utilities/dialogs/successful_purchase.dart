import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';

import 'generic_dialog.dart';

Future<bool> showSuccessfulCouponDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    imageUrl: Assets.updated,
    title: "Purchase Successful!",
    content:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit proin et orci in quam.",
    optionsBuilder: () => {
      "Back": false,
    },
  ).then(
    (value) => value ?? false,
  );
}
