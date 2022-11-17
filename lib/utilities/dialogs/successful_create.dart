import 'package:flutter/material.dart';
import 'package:ninecoin/assets/assets.dart';

import 'generic_dialog.dart';

Future<bool> showSuccessfulCreateAccountDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    imageUrl: Assets.updated,
    title: "Create Successful!",
    content: "",
    optionsBuilder: () => {
      "Back": true,
    },
  ).then(
    (value) => value ?? false,
  );
}
